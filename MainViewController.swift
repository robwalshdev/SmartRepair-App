//
//  MainViewController.swift
//  Smart Repairs
//
//  Created by Robert Walsh on 11/15/17.
//  Copyright © 2017 Robert Walsh. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBAction func callButton(_ sender: Any) {
        if let url = URL(string: "tel://+34622720400"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    @IBAction func websiteButton(_ sender: Any) {
        if let url = NSURL(string: "https://www.smartrepair.es"){
            UIApplication.shared.openURL(url as URL)
        }
    }
    
    @IBAction func facebookButton(_ sender: Any) {
        if let url = NSURL(string: "https://www.facebook.com/SmartRepair.es/"){
            UIApplication.shared.openURL(url as URL)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
