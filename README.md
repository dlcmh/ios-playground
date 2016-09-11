# [Tutorial 3: Social Media - UIBarButtonItem, UIActivityViewController, NSURL](https://www.hackingwithswift.com/read/3/overview)

Let users share to Facebook and Twitter by modifying project 1.

UIActivityViewController

UIBarButtonItem

the Social framework, Twitter and Facebook: SLComposeViewController

NSURL


# Steps

Give users a way to trigger sharing by addding a __bar button item__.

By default, a `UINavigationController` (lets users move between two screens) has a _bar_ across the top, called a `UINavigationBar` - developers can add _buttons_ to this navigation bar that call methods (eg `UIActivityViewController`).

```swift
// DetailViewController.swift
override func viewDidLoad() {
    super.viewDidLoad()
    configureView()
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: #selector(shareTapped)) // the `shareTapped()` method is to be found on `DetailViewController` itself (`target: self`)
}
```

Use `UIBarButtonSystemItem` instead of `barButtonSystemItem` to access the autocompletion list - some interesting options are `Add`, `Edit`, `Camera`, `Camera`, etc.

`navigationItem` in 'DetailViewController.swift' represents `DetailViewController` in the parent Navigation Controller's navigation bar:

> The navigation item used to represent the view controller in a parent's navigation bar. (read-only)

> This is a unique instance of UINavigationItem created to represent the view controller when it is pushed onto a navigation controller. The first time the property is accessed, the UINavigationItem object is created. Therefore, you should not access this property if you are not using a navigation controller to display the view controller. To ensure the navigation item is configured, you can either override this property and add code to create the bar button items when first accessed or create the items in your view controller's initialization code.

> Avoid tying the creation of bar button items in your navigation item to the creation of your view controller's view. The navigation item of a view controller may be retrieved independently of the view controller's view. For example, when pushing two view controllers onto a navigation stack, the topmost view controller becomes visible, but the other view controller's navigation item may be retrieved in order to present its back button.

> The default behavior is to create a navigation item that displays the view controller's title.


UIActivityViewController:

```swift
func shareTapped() {
    let vc = UIActivityViewController(activityItems: [detailImageView.image!], applicationActivities: []) // pass in two items: an array of items you want to share, and an array of any of your own app's services you want to make sure are in the list. We're passing an empty array into the second parameter, because our app doesn't have any services to offer. But if you were to extend this app to have something like "Other pictures like this", for example, then you would include that functionality here.
    vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem // tells iOS where the activity view controller should be anchored (where it should appear from) - on iPhone, activity view controllers automatically take up the full screen, but on iPad they appear as a popover that allows the user to see what they were working on below. This line of code tells iOS to anchor the activity view controller to the right bar button item (our share button), but this only has an effect on iPad – on iPhone it's ignored
    presentViewController(vc, animated: true, completion: nil)
}
```

`navigationItem.setRightBarButtonItems` - array of buttons on the right side of the navigation controller bar:

```swift
override func viewDidLoad() {
    super.viewDidLoad()
    configureView()
    // navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: #selector(shareTapped2))
    let barButtonItem1 = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: #selector(shareTapped1))
    let barButtonItem2 = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: #selector(shareTapped2))
    navigationItem.setRightBarButtonItems([barButtonItem1, barButtonItem2], animated: true)
}
```

