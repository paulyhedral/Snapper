Examples
========

Do the OAuth
------------

The first thing you need to do is the OAuth dance to get your access token. That's outside the scope of Snapper's 
functionality. Once you have it, you need to store it somewhere, like on the keychain.

Let's say you've done that, and you stored the access token in a variable called `accessToken` (naturally).

Get the current token's user info
---------------------------------

Assuming it's the first time the user is running the app, you'll want to find out some more details about them. So, 
you'll call the "current token API". Note that, unlike almost every other API operation in Snapper, which expect an
"account ID" as a parameter, this call just expects the access token and its type (which is usually "Bearer"). It's a 
chicken-and-egg scenario, basically, because you need some user information in order to create the account in Snapper's
account store, but you need to ask for it first from the API.

    __block SNPUser* myUser = nil;
    SNPCurrentTokenOperation* op = [[SNPCurrentTokenOperation alloc] initWithAccessToken:accessToken
                                                                               tokenType:@"Bearer"
                                                                             finishBlock:^(SNPResponse* response) {
                                                                             
                                                                                 if(response.errorId) {
                                                                                     // TODO: handle error
                                                                                     return;
                                                                                 }
                                                                                 
                                                                                 myUser = response.data;
                                                                             }];
    [someOperationQueue addOperation:op];
    [op waitUntilFinished];

Setup the account for API calls
-------------------------------

Once you've got the user information (stored in `myUser` in our lovely example above), you want to store that in
Snapper's account store. In return, you get an `SNPAccount` object, which contains all of that information, plus an
"account ID" that you'll use for the other API calls. Chicken. Egg.

    SNPAccount* account = [[SNPAccountManager sharedAccountManager] createAccountWithName:myUser.name
                                                                                 username:myUser.username
                                                                                   userId:myUser.userId
                                                                              accessToken:accessToken
                                                                                tokenType:@"Bearer"];

Get the personal stream
-----------------------

Now, we're tooling along, and the user wants to see their personal stream.

    SNPGetPersonalStreamOperation* streamOp = [[SNPGetPersonalStreamOperation alloc] initWithAccountId:account.accountId
    																				       finishBlock:^(SNPResponse* response) {

																							   if(response.errorId) {
																								   // TODO: handle error
																							       return;
																						       }
																						       
																						       NSArray* posts = response.data;
																						       
																						       // TODO: process the posts, store them, display them, etc.                                                                                 
																					       }];
	streamOp.unified = YES; // 1
	streamOp.includeDirected = YES; // 2
	streamOp.includeUser = YES; // 3
	streamOp.includeDeleted = YES; // 4
	streamOp.count = 50; // 5
    [someOperationQueue addOperation:streamOp];

In this case, we want (1) a "unified stream" (i.e., users the user follows, plus mentions), (2) "directed posts" (replies to users we don't follow), 
(3) the user object populated in each post, (4) deleted posts, and (5) up to 50 posts in the response. There are quite a few other properties that you
can set that will affect the response; look at the headers for this class, as well as `SNPBaseStreamOperation` and `SNPBaseUserOperation`.

Create a post
-------------

When you decide that you want to butt into someone's conversation, you're going to use `SNPCreatePostOperation`:

	NSString* myContribution = @"@anotheruser A bunch of things I want to say.";
	SNPCreatePostOperation* createOp = [[SNPCreatePostOperation alloc] initWithText:myContribution
																	     	replyTo:12345
																		machineOnly:NO
																		annotations:nil
																		   entities:nil
																		  accountId:account.accountId
																	  progressBlock:nil
																		finishBlock:^(SNPResponse* response) {

																			if(response.errorId) {
																				// TODO: handle error
																				return;
																			}
																						       
																			// TODO: tell the user the good news
																		}];
    [someOperationQueue addOperation:createOp];

This example shows us creating a new post in reply to another post (12345).

Note that if the post is "original material" (i.e., not a reply), the `replyTo` parameter should be `0`. Also, you can create a "machine-only" post by setting
the `machineOnly` parameter to `YES`, but you will also need to supply `nil` for the text parameter. If you supply any text, even an empty string, `machineOnly`
will get ignored.

Upload a file
-------------

Now, suppose you're eating a delicious pastrami sandwich, and like any good Instagram user, you want to share it with the world. You take a picture, get
the image data, and upload for all of ADN to see.

    NSData* imageData = <...image data from somewhere...>;
    SNPCreateFileOperation* fileOp = [[SNPCreateFileOperation alloc] initWithName:@"My Pastrami Sammich"
																      contentType:@"image/png"
																	   	     type:@"sammich.pastrami.delicious"
																		     data:imageData
																	    accountId:account.accountId
																      finishBlock:^(SNPResponse* response) {

																	  	  if(response.errorId) {																	  	  	
																			  // TODO: handle error
																			  return;
																		  }
																						       
																		  // get the file ID so you can link it in a post
																		  SNPFile* file = response.data;
																		  NSInteger fileId = file.fileId;
																		  
																		  // TODO: put it in a post
																	  }];
    [someOperationQueue addOperation:fileOp];

Update a stream marker
----------------------

And when your app is shutting down, don't forget to update the stream marker.

    SNPUpdateStreamMarkerOperation* markerOp = [[SNPUpdateStreamMarkerOperation alloc] initWithPostId:_topPostId
                                                                                                 name:@"global"
                                                                                           percentage:0
                                                                                            accountId:account.accountId
                                                                                          finishBlock:^(SNPResponse* response) {
    
                                                                                              if(response.errorId) {																	  	  	
                                                                                                  // TODO: handle error
                                                                                                  return;
                                                                                              }
																							   
                                                                                              // TODO: nothing?
                                                                                          }];
    [someOperationQueue addOperation:markerOp];																						  
																						  
