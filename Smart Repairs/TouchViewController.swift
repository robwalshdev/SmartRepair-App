//
//  LCDViewController.swift
//  Smart Repairs
//
//  Created by Robert Walsh on 12/3/17.
//  Copyright © 2017 Robert Walsh. All rights reserved.
//

import UIKit

class TouchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let numPerRow = 10
        let width = view.frame.width / CGFloat(numPerRow)

        for j in 0...150 {
            for i in 0...numPerRow {
                let cellView = UIView()
                cellView.backgroundColor = .white
                cellView.frame = CGRect(x: CGFloat(i)*width, y:CGFloat(j)*width, width: width, height: width)
                cellView.layer.borderWidth = 0.5
                cellView.layer.borderColor = UIColor.black.cgColor
                view.addSubview(cellView)
            }
        }
        
        view.addGestureRecognizer(UIPanGestureRecognizer(target:self, action: #selector(handlePan)))
        
        
        
        // Do any additional setup after loading the view.
    }
    
    @objc func handlePan(gesture: UIPanGestureRecognizer){
        let location = gesture.location(in: view)
        
        for subview in view.subviews{
            if subview.frame .contains(location){
                subview.backgroundColor = .black
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
