//
//  DestinationVC.swift
//  IntergalaticTravlerSwift
//
//  Created by Aaron B on 1/28/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//

import UIKit

class DestinationVC: UIViewController {
    var isBlueStar: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.isBlueStar {
            view.backgroundColor = UIColor.blueColor()
        }
        else {
            view.backgroundColor = UIColor.redColor()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
