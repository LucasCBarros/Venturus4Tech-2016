//
//  MainViewController.swift
//  HomeControl
//
//  Created by Rafael M. A. da Silva on 12/10/15.
//  Copyright © 2015 venturus. All rights reserved.
//

import UIKit

class MainViewController:UIViewController{
    
    
    @IBOutlet weak var temperatureImage: UIImageView!
    @IBOutlet weak var lampSwitch: UISwitch!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    override func viewDidLoad() {
        
        
        lampSwitch.addTarget(self, action: #selector(MainViewController.switchLamp), forControlEvents: UIControlEvents.ValueChanged)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MainViewController.fetchTemperature))
        
        temperatureImage.userInteractionEnabled = true
        temperatureImage.addGestureRecognizer(tapGestureRecognizer)
        
        NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: #selector(MainViewController.fetchLampState) , userInfo: nil, repeats: true)
    }
    //////////////
    var homeInfoList = [String]()
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let historyTableViewController = segue.destinationViewController as?HistoryTableViewController
        
        historyTableViewController?.tableViewHomeInfoArray = homeInfoList
    }
    
   
    //////////////////////
    func fetchTemperature() {
        
        IOTService.sharedInstance.fetchTemperature(){(statuscode,error,homeModel)-> Void in
            self.temperatureLabel.text = "\(homeModel!.temperatureValue)º "
//            self.homeInfoList.append("\(homeModel?.temperatureValue)")
        }
//        print("fetchTemperature in progress... ")
    }
    /////////////////////////
    func switchLamp() {
        print("SwitchLamp Changed State ")
        let oldState = !lampSwitch.on
        IOTService.sharedInstance.switchLamp(lampSwitch.on){ (statusCode, error) -> () in
            if let _ = error {
                self.lampSwitch.setOn(oldState, animated: true)
            }
        }
    }
    //////////////////////////
    func fetchLampState() {
        IOTService.sharedInstance.fetchLampState(){(statuscode,error)-> Void in
            print("Lamp is 201/off  or 200/on status is = \(statuscode)")
            let status = statuscode
            
            if status == 201 {
                self.lampSwitch.on = false
            } else {
                self.lampSwitch.on = true
            }
        }
        print("fetchLampState in progress... ")
//        print("get Lamp state")
    
    }
    
}
