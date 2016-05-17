//
//  SecondViewController.swift
//  LNSlideUpTransition
//
//  Created by Nguyen Vu Nhat Minh on 5/17/16.
//  Copyright © 2016 Nguyen Vu Nhat Minh. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btBackClicked(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
