//
//  ViewController.swift
//  IntergalaticTravlerSwift
//
//  Created by Aaron B on 1/28/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
  // MARK: - Segue

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destVC = segue.destinationViewController as! DestinationVC
        destVC.navigationItem.title = sender?.currentTitle
        if segue.identifier == "blue" {
            destVC.isBlueStar = true
    
        }
}
    
}
