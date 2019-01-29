//
//  UpdateCardViewController.swift
//  Fitness eBook Marketplace
//
//  Created by Alek Matthiessen on 1/28/19.
//  Copyright © 2019 The Matthiessen Group, LLC. All rights reserved.
//

import UIKit
import IQKeyboardManager
import Firebase


class UpdateCardViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var exp: UITextField!
    @IBOutlet weak var cctf: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        queryforuser()
        errorlabel.alpha = 0
            
                self.addLineToView(view: exp, position:.LINE_POSITION_BOTTOM, color: UIColor.lightGray, width: 0.5)
        self.addLineToView(view: cctf, position:.LINE_POSITION_BOTTOM, color: UIColor.lightGray, width: 0.5)
        self.addLineToView(view: zip, position:.LINE_POSITION_BOTTOM, color: UIColor.lightGray, width: 0.5)
        self.addLineToView(view: cvc, position:.LINE_POSITION_BOTTOM, color: UIColor.lightGray, width: 0.5)



    }
    @IBOutlet weak var errorlabel: UILabel!
    
    @IBAction func tapSave(_ sender: Any) {
        
        self.view.endEditing(true)

        if cctf.text != "" && zip.text! != "" && cvc.text != "" && exp.text != "" {
        
        ref?.child("Users").child(uid).child("Credit Card").updateChildValues(["Number" : cctf.text!, "Expiration" : exp.text!, "Postal" : zip.text!, "CVC" : cvc.text!])
            
            self.performSegue(withIdentifier: "AfterCC", sender: self)
        } else {
            
            errorlabel.alpha = 1
        }
    }
    
       override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
                self.view.endEditing(true)
        
            }
        func queryforuser() {
    
            ref?.child("Users").child(uid).child("Credit Card").observeSingleEvent(of: .value, with: { (snapshot) in
    
                var value = snapshot.value as? NSDictionary
    
                if var author2 = value?["Number"] as? String {
    
                    self.cctf.text = author2
    
                }
    
                if var author2 = value?["Postal"] as? String {
    
                    self.zip.text = author2
                }
    
                if var author2 = value?["CVC"] as? String {
    
                    self.cvc.text = author2
                }
    
                if var author2 = value?["Expiration"] as? String {
    
                    self.exp.text = author2
                }
    

    
            })
    }
    
    @IBOutlet weak var cvc: UITextField!
    
    @IBOutlet weak var zip: UITextField!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

        enum LINE_POSITION {
            case LINE_POSITION_TOP
            case LINE_POSITION_BOTTOM
        }
    
        func addLineToView(view : UIView, position : LINE_POSITION, color: UIColor, width: Double) {
            let lineView = UIView()
            lineView.backgroundColor = color
            lineView.translatesAutoresizingMaskIntoConstraints = false // This is important!
            view.addSubview(lineView)
    
            let metrics = ["width" : NSNumber(value: width)]
            let views = ["lineView" : lineView]
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[lineView]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
    
            switch position {
            case .LINE_POSITION_TOP:
                view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[lineView(width)]", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
                break
            case .LINE_POSITION_BOTTOM:
                view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[lineView(width)]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
                break
            default:
                break
            }
        }
}
