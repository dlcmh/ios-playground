# [Tutorial 6a: Fix Project 2's Auto Layout issues](https://www.hackingwithswift.com/read/6/overview)

Get to grips with Auto Layout by fixing up issues with the [Guess the Flag project](https://github.com/dlcmh/ios-playground/tree/hws-02-guess-the-flag).

## Steps

Third button's distance to the bottom:

> Select the third flag to see its list of constraints drawn in blue, then (carefully!) select the bottom constraint we just added. In the utilities view on the right, choose the attributes inspector (Alt+Cmd+4), and you should see Relation set to Equal and Constant set to 140 (or some other value, depending on your layout).

> What you need to do is change Equal to be "Greater Than or Equal", then change the Constant value to be 20. This sets the rule "make it at least 20, but you can make it more to fill up space." The layout won't change visually while you're doing this, because the end result is the same. But at least now that Auto Layout knows it has some flexibility beyond just stretching the flags!

Equal height buttons:

> Select the second button, then Ctrl-drag to the first button. When given the list of options, choose Equal Heights. Now do the same from the third button to the second button. This rule ensures that at all times the three flags have the same height, so Auto Layout can no longer squash one button to make it all fit and instead has to squash all three equally.


Aspect ratio:

> Select the first button, then Ctrl-drag a little bit upwards – but stay within the button! When you release your mouse button, you'll see the option "Aspect Ratio", so please choose it.

[Click for full size](https://raw.githubusercontent.com/dlcmh/ios-playground/hws-06-auto-layout/1.png)
![Auto Layout issues fixed)](1.png "Auto Layout issues fixed")
