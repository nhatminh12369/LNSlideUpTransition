# LNSlideUpTransition
A very simple slide-up transition which adopts UIViewControllerAnimatedTransitioning

![demo](https://raw.githubusercontent.com/nhatminh12369/LNSlideUpTransition/master/demo.gif)

## Installation
Copy SlideUpPresentAnimatedTransitioning.swift and SlideUpDismissAnimatedTransitioning.swift into your project

## Usage
```swift
class YourViewController: UIViewController, UIViewControllerTransitioningDelegate {
    private let slideUpPresentTransitioning = SlideUpPresentAnimatedTransitioning()
    private let slideUpDismissTransitioning = SlideUpDismissAnimatedTransitioning()

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationViewController = segue.destinationViewController
        destinationViewController.transitioningDelegate = self
    }
    
    // Transitioning delegate
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return slideUpPresentTransitioning
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return slideUpDismissTransitioning
    }
}
```

## Authors

Minh Nguyen, nvnminh0@gmail.com

## License

LNSlideUpTransition is available under the MIT license. See the LICENSE file for more info.
