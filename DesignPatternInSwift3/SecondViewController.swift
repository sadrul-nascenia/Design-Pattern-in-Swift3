//
//  SecondViewController.swift
//  DesignPatternInSwift3
//
//  Created by Sadrul on 12/20/16.
//  Copyright © 2016 Sadrulnascenia. All rights reserved.
//

import UIKit
let myNotificationKey = "com.bobthedeveloper.notificationKey"

protocol ProtocolName {
    func setValueFrmSecondVc(valueSent: String)
}

class SecondViewController: UIViewController {

    var delegate: ProtocolName?
    var receivedMsgFromFirstVC = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        displayAlert(alertMsg: receivedMsgFromFirstVC)
    }

    private func displayAlert(alertMsg: String) {
        let toastLabel = UILabel(frame: CGRect(x : self.view.frame.size.width/2 - 150, y: self.view.frame.size.height-100, width : 300, height : 35))
        toastLabel.backgroundColor = UIColor.black
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = NSTextAlignment.center
        self.view.addSubview(toastLabel)
        toastLabel.text = alertMsg
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds  =  true
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func previousBtnAction(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: myNotificationKey), object: nil)
        delegate?.setValueFrmSecondVc(valueSent: "Data Using Delegate Protocol Pattern")
        _ = navigationController?.popViewController(animated: true)
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
