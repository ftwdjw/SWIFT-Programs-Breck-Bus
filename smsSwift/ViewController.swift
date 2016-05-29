//
//  ViewController.swift
//  smsSwift
//
//  Created by John Mac on 1/5/16.
//  Copyright © 2016 John Wetters. All rights reserved.
//

import UIKit
import MessageUI


class ViewController: UIViewController, MFMessageComposeViewControllerDelegate,UINavigationControllerDelegate {

    
    @IBOutlet weak var feedbackMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func BreckStation(sender: UIButton) {
        
        let msgVC = MFMessageComposeViewController()
        
        let canSend = MFMessageComposeViewController.canSendAttachments()
        
        if (canSend){
        
        print("this device can send text")
        
        msgVC.body = "BFR 210"
        msgVC.recipients = ["41411"]
        msgVC.messageComposeDelegate = self
        
        print("BreckStation sms sent")
        
        self.presentViewController(msgVC, animated: true, completion: nil)
            
        }
        else  {
            
        print("this device can not send text")
            
            self.feedbackMessage.hidden = false ;
            self.feedbackMessage.text = "Device not configured to send SMS."
            
        }
    
        
    }
    
    
    
    func messageComposeViewController(controller: MFMessageComposeViewController, didFinishWithResult result: MessageComposeResult) {
        
        self.feedbackMessage.hidden = false ;
        
        switch (result)
        {
        case MessageComposeResultCancelled:
            print("Result: SMS sending canceled")
            self.feedbackMessage.text = "Result: SMS sending canceled"
            break
            
        case MessageComposeResultSent:
            print("Result: SMS sent")
            self.feedbackMessage.text = "Result: SMS sent"
            break
            
        case MessageComposeResultFailed:
            print("Result: SMS sending failed")
             self.feedbackMessage.text = "Result: SMS sending failed"
            break
            
        default:
            print("Result: SMS not sent")
             self.feedbackMessage.text = "Result: SMS not sent"
            break
            
        }
        
        
        self.presentViewController(controller, animated: true, completion: nil)
    

    }
    
    
    
}

