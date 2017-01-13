//
//  ViewController.swift
//  DesignPatternInSwift3
//
//  Created by Sadrul on 12/20/16.
//  Copyright © 2016 Sadrulnascenia. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, ProtocolName {
    var valueSentFromSecondViewController:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(doSomethingAfterNotified),
                                               name: NSNotification.Name(rawValue: myNotificationKey),
                                               object: nil)
    }

    func doSomethingAfterNotified() {
        displayAlertforNotification(alertMsg: "Data Using Nsnotification")
    }
    
    internal func setValueFrmSecondVc(valueSent: String){
        displayAlert(alertMsg: valueSent)
    }

    private func displayAlert(alertMsg : String){
        let toastLabel = UILabel(frame: CGRect(x : self.view.frame.size.width/2 - 150,y: self.view.frame.size.height-100, width : 300, height : 35))
        toastLabel.backgroundColor = UIColor.black
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = NSTextAlignment.center;
        self.view.addSubview(toastLabel)
        
        toastLabel.text = alertMsg
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: nil)
    }
    
    private func displayAlertforNotification(alertMsg : String){
        let toastLabel = UILabel(frame: CGRect(x : self.view.frame.size.width/2 - 150,y: self.view.frame.size.height-250, width : 300, height : 35))
        toastLabel.backgroundColor = UIColor.blue
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = NSTextAlignment.center;
        self.view.addSubview(toastLabel)
        toastLabel.text = alertMsg
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: nil)
    }

    @IBAction func nextBtnAction(_ sender: Any) {
        
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        secondViewController.delegate = self
        secondViewController.receivedMsgFromFirstVC = "Forward Data Passing"
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }

    override  func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

