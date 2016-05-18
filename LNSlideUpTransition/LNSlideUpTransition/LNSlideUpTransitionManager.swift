//
//  SlideUpTransitionManager.swift
//  LNSlideUpTransition
//
//  Created by Nguyen Vu Nhat Minh on 5/18/16.
//  Copyright © 2016 Nguyen Vu Nhat Minh. All rights reserved.
//

import UIKit

class LNSlideUpTransitionManager: NSObject, UIViewControllerTransitioningDelegate {
    private let slideUpPresentTransitioning = LNSlideUpPresentAnimatedTransitioning()
    private let slideUpDismissTransitioning = LNSlideUpDismissAnimatedTransitioning()
    
    let BOUNCE_DURATION = 1.1
    let DEFAULT_DURATION = 0.5
    
    var duration:Double!
    var bounceAnimation:Bool = false
    var springAnimation:Bool = false
    
    override init() {
        super.init()
        duration = DEFAULT_DURATION
        slideUpPresentTransitioning.transitionManager = self
        slideUpDismissTransitioning.transitionManager = self
    }
    
    // Transitioning delegate
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return slideUpPresentTransitioning
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return slideUpDismissTransitioning
    }
}
