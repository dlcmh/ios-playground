# [Project 7: Whitehouse Petitions: JSON and NSData – Overview – a free Hacking with Swift tutorial](https://www.hackingwithswift.com/read/7/overview)

Make an app to parse Whitehouse petitions using JSON and a tab bar.

SwiftyJSON: When you use arrayValue with SwiftyJSON, you either get back an __array of objects__ or an __empty array__, so we use the return value in our loop.

JSON, NSData:

> To download data and convert it to a SwiftyJSON object, we're going to use `NSURL` alongside a new NS class called `NSData`. This is a class designed to hold data in any form, which might be a string, it might be an image, or it might be something else entirely. You already saw that `NSString` can be created using `contentsOfFile` to load data from disk. Well, `NSData` (and `NSString`) can be created using `contentsOfURL`, which downloads data from a URL (specified using `NSURL`) and makes it available to you.

[Click for full size](https://raw.githubusercontent.com/dlcmh/ios-playground/hws-07-whitehouse-petitions/1.png)<br>
![JSON data](1.png "JSON data")
