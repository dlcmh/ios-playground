# [Tutorial 2: Guess the Flag Game - Asset catalogs, UIButton, CALayer, UIColor, UIAlertController](https://www.hackingwithswift.com/read/2/overview)

Make a game using UIKit, and learn about integers, buttons, colors and actions.


@2x and @3x images for UIButton

asset catalogs: `Assets.xcassets` 'file'

integers, doubles, floats

operators (+= and -=)

enums - used in setting `UIControlState.Normal` for the type expected by `button: UIButton!` `setImage()` method.

CALayer - Core Animation type that backs all iOS views and is responsible for their appearance. Example of an appearance option is `borderWidth`. Sample call:

```swift
// 1 pixel on non-retina devices, 2 pixels on retina devices, and 3 on retina HD devices
button1.layer.borderWidth = 1
button2.layer.borderWidth = 1
button3.layer.borderWidth = 1
```

For suggestions on looping through button subviews, see [http://stackoverflow.com/questions/25715022/how-to-loop-through-all-uibuttons-in-my-swift-view](http://stackoverflow.com/questions/25715022/how-to-loop-through-all-uibuttons-in-my-swift-view).

UIColor - because CALayer is at a lower technical level than UIView, it doesn't understand UIColor; it only understands CGColor, which comes from Apple's Core Graphics. UIColor is able to convert to/from CGColor easily, by appending `.CGColor` to a `UIColor()` call:

```swift
button1.layer.borderColor = UIColor.lightGrayColor().CGColor
button2.layer.borderColor = UIColor.lightGrayColor().CGColor
button3.layer.borderColor = UIColor(red: 1.0, green: 0.6, blue: 0.2, alpha: 0.3).CGColor
```

random numbers - Use GameplayKit (introduced in iOS 9) which guarantees true random number generation. Add `import GameplayKit`:

```swift
// shuffle array content
countries = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(countries) as! [String]

// generate a random Int from 0 to 1 less than upper bound
correctAnswer = GKRandomSource.sharedRandom().nextIntWithUpperBound(3)
```

actions - connect all 3 buttons to the same @IBAction, but give each button a different `Tag` value (found in the Attibutes Inspector). Then (with string interpolation & `UIAlertController`):

```swift
// title refers to the `title` item in the Navigation Controller
@IBAction func buttonTapped(sender: UIButton) {
    var title: String // `var title` declared here does not conflict with `title` declared at class level which refers to the Navigation Controller title item.

    if sender.tag == correctAnswer {
        title = "Correct"
        score += 1
    } else {
        title = "Wrong"
        score -= 1
    }

    let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .Alert)
    ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: askQuestion))
    presentViewController(ac, animated: true, completion: nil)
}
```


# Steps

Single View Application projects don't come with a navigation controller as a standard, so:

Click inside the View Controller

Click menu `Editor > Embed In > Navigation Controller` -> specifying the following for `title` property in `ViewController.swift` sets the title in the Navigation Controller (works for Tab Controller too):

```swift
// Sets the title to a human-readable string that describes the view. If the view controller has a valid navigation item or tab-bar item, assigning a value to this property updates the title text those objects.
title = countries[correctAnswer].uppercaseString
```
