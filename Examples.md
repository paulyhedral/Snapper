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



Create a post
-------------


Upload a file
-------------


Update a stream marker
----------------------

