//
//  LoyaltyViewController.swift
//  Smart Repairs
//
//  Created by Robert Walsh on 11/29/17.
//  Copyright © 2017 Robert Walsh. All rights reserved.
//

import UIKit

class LoyaltyViewController: UIViewController {
    
    @IBOutlet var repair1: UIImageView!
    @IBOutlet var repair2: UIImageView!
    @IBOutlet var repair3: UIImageView!
    @IBOutlet var code: UILabel!
    @IBOutlet var discountLabel: UILabel!
    
    var repairsTotal = 0
    let secretPin = "0000"
    var counter = 0
    var pinEntered = String()
    
    @IBOutlet var getCodeBtn: UIButton!
    @IBOutlet var pinPadStk: UIStackView!
    
    @IBAction func getCode(_ sender: Any) {
        UIView.animate(withDuration: 0.35, animations: { [unowned self] in
            self.repair1.isHidden = true
            self.repair2.isHidden = true
            self.repair3.isHidden = true
            self.discountLabel.isHidden = true
            self.getCodeBtn.isHidden = true
            
            self.code.isHidden = false
            self.pinPadStk.isHidden = false
        })
        
    }
    
    @IBAction func pinNumber(_ sender: Any) {
        var tempString = String()
        if counter != 4 {
            switch (sender as AnyObject).tag {
            case 1:
                tempString = "1"
                pinEntered = pinEntered + tempString
                code.text = pinEntered
                break
            case 2:
                tempString = "2"
                pinEntered = pinEntered + tempString
                code.text = pinEntered

                break
            case 3:
                tempString = "3"
                pinEntered = pinEntered + tempString
                code.text = pinEntered

                break
            case 4:
                tempString = "4"
                pinEntered = pinEntered + tempString
                code.text = pinEntered

                break
            case 5:
                tempString = "5"
                pinEntered = pinEntered + tempString
                code.text = pinEntered

                break
            case 6:
                tempString = "6"
                pinEntered = pinEntered + tempString
                code.text = pinEntered

                break
            case 7:
                tempString = "7"
                pinEntered = pinEntered + tempString
                code.text = pinEntered

                break
            case 8:
                tempString = "8"
                pinEntered = pinEntered + tempString
                code.text = pinEntered

                break
            case 9:
                tempString = "9"
                pinEntered = pinEntered + tempString
                code.text = pinEntered
            case 10:
                tempString = "0"
                pinEntered = pinEntered + tempString
                code.text = pinEntered
                break
            default:
                break
            }
            counter += 1
        }
        if pinEntered.count == 4{
            if secretPin == pinEntered{
                //Alert View and update repairs
                let alert = UIAlertController(title: "Success", message: "Repair Registered", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                pinEntered = String()
                counter = 0
                repairsNumber()
                code.text = "****"
                
            } else {
                //Alert View and Reset
                let alert = UIAlertController(title: "Error", message: "Incorrect Code Entered. Please try again", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                pinEntered = String()
                counter = 0
                code.text = "****"
            }
        }
        
    }
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let i = UserDefaults.standard.integer(forKey: "repairsTotal")
        for x in 0...i{
            if x == 1 {
                repair1.image = UIImage(named: "repair 1")
            }
            if x == 2 {
                repair2.image = UIImage(named: "repair 2")
            }
            if x == 3 {
                repair3.image = UIImage(named: "repair 3")
            }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func repairsNumber(){
        UIView.animate(withDuration: 0.35, animations: { [unowned self] in

        self.repair1.isHidden = false
        self.repair2.isHidden = false
        self.repair3.isHidden = false
        self.discountLabel.isHidden = false
        self.getCodeBtn.isHidden = false
        
        self.code.isHidden = true
        self.pinPadStk.isHidden = true
        })
        
        if UserDefaults.standard.integer(forKey: "repairsTotal") < 3 {

            switch UserDefaults.standard.integer(forKey: "repairsTotal") {
            case 0:
                repair1.image = UIImage(named: "repair 1")
            case 1:
                repair2.image = UIImage(named: "repair 2")
            case 2:
                repair3.image = UIImage(named: "repair 3")
            default:
                break
            }
            repairsTotal = UserDefaults.standard.integer(forKey: "repairsTotal") + 1
            UserDefaults.standard.set(repairsTotal, forKey: "repairsTotal")

        } else {
            repairsTotal = 0
            UserDefaults.standard.set(0, forKey: "repairsTotal")
            repair1.image = UIImage(named: "repair 0")
            repair2.image = UIImage(named: "repair 0")
            repair3.image = UIImage(named: "repair 0")
        }
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
