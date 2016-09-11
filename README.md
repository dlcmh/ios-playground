# [Tutorial 4: Easy Browser - loadView(), WKWebView, NSURLRequest, UIToolbar, UIProgressView, key-value observing](https://www.hackingwithswift.com/read/4/overview)

Embed Web Kit (and use code instead of Interface Builder to perform layout and add views) and learn about delegation, KVO, classes and UIToolbar.

loadView()

WKWebView, decidePolicyForNavigationAction (allow/disallow following of links via whitelisting)

delegation

classes and structs

NSURLRequest

UIToolbar: a toolbar component that holds `UIBarButtonItem`s -> refer to [https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/UIKitUICatalog/UIToolbar.html#//apple_ref/doc/uid/TP40012857-UIToolbar-SW1](https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/UIKitUICatalog/UIToolbar.html#//apple_ref/doc/uid/TP40012857-UIToolbar-SW1)

UIProgressView

key-value observing

UIAlertController

NSURL


## Steps

Embed View Controller in Navigation Controller

`import WebKit` in 'ViewController.swift'

Instead of merely overriding `viewDidLoad()`, add a `loadView()` function to override the actual loading of the view.

`UIAlertController` to allow users to select from a list of websites to open - will be triggered from a `UIBarButtonItem` that displays a title instead of a system icon (eg as displayed by the `UIBarButtonItem style: .Action` button)


Setting the web page title in the Navigation Controller bar (type webvididfina for function creation autocompletion):

```swift
func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
    title = webView.title
}
```

[Click for full size](https://raw.githubusercontent.com/dlcmh/ios-playground/hws-04-easy-browser/1.png)
![UINavigationBar & navigationItem, UIToolbar & toolbarItems, UIProgressView)](1.png "UINavigationBar & navigationItem, UIToolbar & toolbarItems, UIProgressView)")
