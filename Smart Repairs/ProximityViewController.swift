//
//  ProximityViewController.swift
//  Smart Repairs
//
//  Created by Robert Walsh on 12/3/17.
//  Copyright © 2017 Robert Walsh. All rights reserved.
//

import UIKit

class ProximityViewController: UIViewController {

    @IBOutlet var statusLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let device = UIDevice.current
        device.isProximityMonitoringEnabled = true
        if device.isProximityMonitoringEnabled {
            print("Working")
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
