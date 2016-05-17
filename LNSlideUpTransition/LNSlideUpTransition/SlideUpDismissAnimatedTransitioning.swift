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

class SlideUpDismissAnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey),
            let containerView = transitionContext.containerView(),
            let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) else {
                return
        }
        let finalFrameFromVC = CGRectMake(0, fromVC.view.frame.size.height, fromVC.view.frame.size.width, fromVC.view.frame.size.height)
        
        
        toVC.view.transform = CGAffineTransformMakeScale(0.9, 0.9)
        let snapshot = fromVC.view.snapshotViewAfterScreenUpdates(false)
        let blackBG = UIView(frame: fromVC.view.frame)
        let mask = UIView(frame: fromVC.view.frame)
        blackBG.backgroundColor = UIColor.blackColor()
        mask.backgroundColor = UIColor.blackColor()
        containerView.addSubview(blackBG)
        containerView.addSubview(toVC.view)
        containerView.addSubview(mask)
        containerView.addSubview(snapshot)
        
        
        let duration = transitionDuration(transitionContext)
        
        UIView.animateKeyframesWithDuration(
            duration,
            delay: 0,
            options: .CalculationModePaced,
            animations: {
                
                snapshot.frame = finalFrameFromVC
                toVC.view.transform = CGAffineTransformMakeScale(1.0, 1.0)
                mask.alpha = 0.0
            },
            completion: { _ in
                fromVC.view.hidden = false
                snapshot.removeFromSuperview()
                blackBG.removeFromSuperview()
                mask.removeFromSuperview()
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        })
    }
}
