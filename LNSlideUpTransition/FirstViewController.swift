//
//  FirstViewController.swift
//  LNSlideUpTransition
//
//  Created by Nguyen Vu Nhat Minh on 5/17/16.
//  Copyright © 2016 Nguyen Vu Nhat Minh. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIViewControllerTransitioningDelegate {
    private let slideUpPresentTransitioning = SlideUpPresentAnimatedTransitioning()
    private let slideUpDismissTransitioning = SlideUpDismissAnimatedTransitioning()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btNextClicked(sender: AnyObject) {
        
    }
    
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
