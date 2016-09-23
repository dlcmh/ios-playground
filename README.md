# [Project 10: Names to Faces](https://www.hackingwithswift.com/read/10/overview)

Re-work Project 7 to learn how to run complex tasks in the background with GCD.UICollectionView, UIImagePickerController, UUID, classes

Get started with UICollectionView and the photo library.

Step 1: Change:

```swift
//  ViewController.swift
// class ViewController: UIViewController {
class ViewController: UICollectionViewController {
```

Step 2: In `Main.storyboard`, delete the View Controller and drag in a __Collection View Controller__. Make the Collection View Controller the initial view controller before embedding it inside a Navigation Controller; also change its class to `ViewController` so that it points to our code in `ViewController.swift`.

Step 3: Use the document outline to select the collection view inside the collection view controller, then go to the size inspector and set Cell Size to have the width 140 and height 180. Now set the __Section Insets__ for top, bottom, left and right to all be 10.


[Click for full size](https://raw.githubusercontent.com/dlcmh/ios-playground/hws-09-grand-central-dispatch/1.png)
![...](1.png "...")
