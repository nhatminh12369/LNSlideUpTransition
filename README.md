# LNSlideUpTransition
A simple slide-up transition which adopts UIViewControllerAnimatedTransitioning.

![demo](https://raw.githubusercontent.com/nhatminh12369/LNSlideUpTransition/master/demo.gif)

## Installation
Copy 'LNSlideUpTransition' folder into your project. There are 3 files in that folder:
LNSlideUpPresentAnimatedTransitioning.swift
LNSlideUpDismissAnimatedTransitioning.swift
LNSlideUpTransitionManager.swift

## Usage
You need to set the transitionDelegate of the destination view controller to an instance of LNSlideUpTransitionManager

```swift
class FirstViewController: UIViewController {

    var slideUpTransition:LNSlideUpTransitionManager = LNSlideUpTransitionManager()
    
    ....

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationViewController = segue.destinationViewController
//       slideUpTransition.duration = 0.6
//       // You can turn on either springAnimation or bounceAnimation. If you turn on both, spring animation               will be used
//       slideUpTransition.springAnimation = true
//       slideUpTransition.bounceAnimation = true
        destinationViewController.transitioningDelegate = slideUpTransition
    }
}

```

## Authors

Minh Nguyen, nvnminh0@gmail.com

## License

LNSlideUpTransition is available under the MIT license. See the LICENSE file for more info.
