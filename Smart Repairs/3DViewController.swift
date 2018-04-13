//
//  3DViewController.swift
//  Smart Repairs
//
//  Created by Robert Walsh on 12/3/17.
//  Copyright © 2017 Robert Walsh. All rights reserved.
//

import UIKit

class _DViewController: UIViewController {

    @IBOutlet var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }

    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        if let touch = touches.first {
            if view.traitCollection.forceTouchCapability == .available {
                if touch.force == touch.maximumPossibleForce {
                    statusLabel.text = "Force touch registered"
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
