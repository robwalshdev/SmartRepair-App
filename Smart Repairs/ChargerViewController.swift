//
//  ChargerViewController.swift
//  Smart Repairs
//
//  Created by Robert Walsh on 12/3/17.
//  Copyright © 2017 Robert Walsh. All rights reserved.
//

import UIKit

class ChargerViewController: UIViewController {

    @IBOutlet var chargerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIDevice.current.isBatteryMonitoringEnabled = true
        let battery = UIDevice.current.batteryState
        
        if battery == .charging{
            chargerLabel.text = "Device is Charging"
        } else {
            chargerLabel.text = "Device not Charging"
        }
        print(battery)
        
        // Do any additional setup after loading the view.
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
