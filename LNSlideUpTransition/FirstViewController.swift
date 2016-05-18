//
//  FirstViewController.swift
//  LNSlideUpTransition
//
//  Created by Nguyen Vu Nhat Minh on 5/17/16.
//  Copyright © 2016 Nguyen Vu Nhat Minh. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var slideUpTransition:LNSlideUpTransitionManager = LNSlideUpTransitionManager()
    
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
//        slideUpTransition.duration = 0.6
//        // You can turn on either springAnimation or bounceAnimation. If you turn on both, spring animation will be used
//        slideUpTransition.springAnimation = true
//        slideUpTransition.bounceAnimation = true
        destinationViewController.transitioningDelegate = slideUpTransition
    }
}
