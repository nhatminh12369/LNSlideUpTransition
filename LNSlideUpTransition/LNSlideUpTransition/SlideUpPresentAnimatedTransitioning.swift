/**
 Copyright (c) 2016 Minh Nguyen <nvnminh0@gmail.com>
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 **/

import UIKit

class SlideUpPresentAnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
        
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey),
            let containerView = transitionContext.containerView(),
            let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) else {
                return
        }
        
        let snapshot = toVC.view.snapshotViewAfterScreenUpdates(true)
        
        let initialFrame = CGRectMake(0, snapshot.frame.size.height, snapshot.frame.size.width, snapshot.frame.size.height)
        let finalFrame = transitionContext.finalFrameForViewController(toVC)
        snapshot.frame = initialFrame
        
        let mask = UIView(frame: fromVC.view.frame)
        mask.backgroundColor = UIColor.blackColor()
        mask.alpha = 0.0
        
        containerView.addSubview(mask)
        containerView.addSubview(toVC.view)
        containerView.addSubview(snapshot)
        toVC.view.hidden = true
        
        let duration = transitionDuration(transitionContext)
        
        UIView.animateKeyframesWithDuration(
            duration,
            delay: 0,
            options: .CalculationModePaced,
            animations: {
                
                UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 0.5, animations: {
                    mask.alpha = 1.0
                })
                
                UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 1.0, animations: {
                    snapshot.frame = finalFrame
                    fromVC.view.transform = CGAffineTransformMakeScale(0.9, 0.9)
                })
            },
            completion: { _ in
                toVC.view.hidden = false
                snapshot.removeFromSuperview()
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
                mask.removeFromSuperview()
        })
        
    }
}
