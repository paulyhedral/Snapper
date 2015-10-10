Snapper
=======

[![Build Status](https://travis-ci.org/exsortis/Snapper.svg?branch=master)](https://travis-ci.org/exsortis/Snapper)
[![Version](https://cocoapod-badges.herokuapp.com/v/Snapper/badge.png)](http://cocoadocs.org/docsets/Snapper)
[![Platform](https://cocoapod-badges.herokuapp.com/p/Snapper/badge.png)](http://cocoadocs.org/docsets/Snapper)

App.net SDK in Objective-C

Version
-------

0.64.4

Platforms
---------

Snapper is designed to work on iOS 7.0 or higher, or Mac OS X Mavericks (10.9) or higher.

Requirements
------------

Snapper requires ARC, and should compile and test in Xcode 5.1 or higher.

Snapper makes use of the GitHub framework [Mantle](http://github.com/github/Mantle) for its model objects. You will need to perform `git submodule update --init --recursive` to pull down Mantle and its dependencies.

Use of Snapper assumes familiarity with the [App.net API](https://developers.app.net) and assumes that your app's configuration has all migrations enabled.

Usage
-----

Snapper makes extensive use of blocks for progress and completion callbacks. All API calls are built upon `NSOperation`, to allow for asynchronous activity. No funny business is performed inside of these operations, so you can use them as you would any other `NSOperation`, including calling `[op waitUntilFinished]` if you need synchronous behavior. Snapper doesn't provide any specific operation queues, so you are free to queue up operations in whatever manner you see fit.

### Account Management

Almost all API calls require an access token of some sort. It is beyond the scope of this library to create or manage OAuth 2 access tokens, or to store them in a secure location, such as the iOS or Mac OS X keychain. However, Snapper uses an internal account store to retrieve access tokens when API calls are being constructed.

The first order of business when using Snapper is to store one or more access tokens. This is done like so:

	SNPAccount* account = [[SNPAccountManager sharedAccountManager] createAccountWithName:@"The Pilgrim"
                                                                                 username:@"pilgrim"
                                                                                   userId:1199
                                                                              accessToken:@"12345"
                                                                                tokenType:@"Bearer"];

The returned `account` object includes a property, `accountId`, with a generated opaque ID for the account. You will use this ID for any operations which require the access token.

Note that this account manager is *runtime-only*. Account information is *not persisted*.

### Model Objects

The following model objects are defined. Note that some of these objects are only used inside of other model objects. Operations that request an `NSArray` of objects expect objects of these types and not dictionaries.

* ACL
* Annotation
* Channel
* Configuration
* Description
* Entity
* File
* Filter
* Filter Clause
* Hashtag
* Image
* Interaction
* Link
* Mention
* Message
* Place
* Post
* Stream
* Stream Marker
* Token
* User

Some notes are in order for a few of these model objects.

#### ACL

This is the object contained inside a `Channel`'s `readers` or `writers` properties.

#### Annotation

Represents `Post`, `Message`, or `User` annotations. Note that the `value` property is only a dictionary, to allow for the flexibility inherent in annotations.

#### Description

This object represents the dictionary contained in `User` objects. Note that it does not contain an `entities` property with subordinate `mentions`, `links`, or `hashtags` array properties; those properties exist at the root of this object.

#### Entity

This is an abstract object that is inherited by the `Mention`, `Link`, and `Hashtag` objects. It will probably never be used directly, but provides a common base for those entities.

### Operations

All operations provide their responses by way of blocks. With a few exceptions, the signature for these blocks contain one parameter: `SNPResponse`. 

There are far too many operations defined in Snapper to list them here. Please browse the source code or headers to see which operations are available. Operations are named so that they correspond exactly or as close as possible to the resources documented in the [official App.net API documents](https://developers.app.net).

### Miscellaneous

#### Responses and Metadata

Responses are encapsulated in the `SNPResponse` object. Inside the response object is a `data` property (an `id`, because results can be an object, a dictionary, or an array of objects, depending on the endpoint), and a `metadata` property. The `metadata` property is an `SNPMetadata` object that contains some combination of error information, stream marker information, and/or pagination data.

When processing responses from an operation, examine the `data` property first: if it's `nil`, there is likely an error, and the various error properties in the `SNPMetadata` object will provide more details.

#### API Utilities

The `SNPAPIUtils` class provides some methods for constructing URLs to the various App.net API endpoints. You will almost never have to use these directly. However, this class provides a property that allows you to change the "API root" (i.e., `https://alpha-api.app.net/stream/0`) if the occasion arises (e.g., if App.net releases a "development environment", or you create a stubbed API server for testing).

Unit Testing
------------

Snapper includes unit tests for iOS and Mac OS X. Unit tests are provided for most functions. The notable exception is for the `*Operation` classes: since these require an OAuth 2 access token in order to function, creating unattended unit tests seems pointless. Insight into making this work without compromising security is greatly appreciated.

License
-------

Snapper is available under the MIT license.

Copyright &copy; 2014 Pilgrimage Software

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
