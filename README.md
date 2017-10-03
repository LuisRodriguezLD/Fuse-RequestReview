Fuse-RequestReview
===================

What is this?
-------------
Request a review from your users without leaving the app.
Exposes Apple's [requestReview()](https://developer.apple.com/documentation/storekit/skstorereviewcontroller/2851536-requestreview).
Written in Swift and implemented using Foreign code.


How do I use it?
----------
First you need [Fuse Device](https://github.com/MaxGraey/fuse-device) by [MaxGraey](https://github.com/MaxGraey).
Then you need to `require` both.
```
var Device = require("Device");
var Review = require("ReviewModule");
```
`requestReview()` only works for iOS 10.3 or greater so we need to parse the systemVersion.
```
var OS = parseFloat(Device.systemVersion);
```
After that just check the OS and go
```
if(OS >= 10.3){ Review.requestReview() };
```

Image
----------
![alt text](http://luisrodriguez.ws/github/review_image.png "It's working!!")


> **Important Notes:**
> - iOS 10.3 or greater required.
> - While developing `requestReview()` will *always* work, however, when you release the app this _will_ change. The function will only fire if the user has spent some time in the app. You can't just fire it at start, that won't work.
> - This *does not* work while distribuiting through Testflight.
> - More tips on how to use [here](https://www.behradbagheri.com/boringb-tutorials/2017/4/a-proper-way-to-request-review-using-skstorereviewcontroller-in-ios-103-and-higher)
