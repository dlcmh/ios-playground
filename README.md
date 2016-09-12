# [Tutorial 6b: Auto Layout](https://www.hackingwithswift.com/read/6/overview)

Get to grips with Auto Layout using practical examples, code and Auto Layout Visual Format Language (VFL).

## Steps

```swift
// ViewController.swift

// ...
    let label1 = UILabel()
    label1.translatesAutoresizingMaskIntoConstraints = false // By default iOS generates Auto Layout constraints for you based on a view's size and position. We'll be doing it by hand, so we need to disable this feature.

// ...
    view.addSubview(label1)

// ...
override func prefersStatusBarHidden() -> Bool {
    return true
}
```

> If you run the app now, you'll see seem some colorful labels at the top, overlapping so it looks like it says "LABELS ME". That's because our labels are placed in their default position (at the top-left of the screen) and are all sized to fit their content.

[Click for full size](https://raw.githubusercontent.com/dlcmh/ios-playground/hws-06b-auto-layout/1.png)<br>
![Overlapping labels from top-left corner by default](1.png "Overlapping labels from top-left corner by default")


Horizontal VFL:

```swift
let viewsDictionary = ["label1": label1, "label2": label2,
                       "label3": label3, "label4": label4,
                       "label5": label5]
for label in viewsDictionary.keys {
    view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[\(label)]|", options: [], metrics: nil, views: viewsDictionary))
```

[Click for full size](https://raw.githubusercontent.com/dlcmh/ios-playground/hws-06b-auto-layout/2.png)<br>
![With Horizontal VFL](2.png "With Horizontal VFL")

Vertical VFL:

```swift
view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[label1]-[label2]-[label3]-[label4]-[label5]", options: [], metrics: nil, views: viewsDictionary))
```

[Click for full size](https://raw.githubusercontent.com/dlcmh/ios-playground/hws-06b-auto-layout/3.png)<br>
![With Vertical VFL)](3.png "With Vertical VFL")


Replace vertical VFL with one that adds a constraint for the bottom edge saying that the bottom of last label must >= 10 points away from the bottom of the view controller's view. The height of each label should also be able to be set by assigning a dictionary to the `metrics` option. We're also going to add priorities for Auto Layout to be able to decide which constraints to to apply if all constraints cannot be simultaneously satisfied (constraints are evaluated from highest priority to lowest, but all will be taken into account - so set `label1` to priority 999 and have the other labels adopt height of `label1`):

```swift
view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[label1(labelHeight@999)]-[label2(label1)]-[label3(label1)]-[label4(label1)]-[label5(label1)]->=10-|", options: [], metrics: ["labelHeight": 88], views: viewsDictionary))
```

[Click for full size](https://raw.githubusercontent.com/dlcmh/ios-playground/hws-06b-auto-layout/4.png)<br>
![Portrait](4.png "Portrait")

[Click for full size](https://raw.githubusercontent.com/dlcmh/ios-playground/hws-06b-auto-layout/5.png)<br>
![Landscape](5.png "Landscape")
