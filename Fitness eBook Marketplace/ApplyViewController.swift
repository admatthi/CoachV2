//
//  ApplyViewController.swift
//  Fitness eBook Marketplace
//
//  Created by Alek Matthiessen on 1/29/19.
//  Copyright © 2019 The Matthiessen Group, LLC. All rights reserved.
//

import UIKit

class ApplyViewController: UIViewController, UITextFieldDelegate {

    var questions = [String]()
    var answers = [String]()
    var counter = 0
    
    @IBAction func tapBack(_ sender: Any) {
        
     self.dismiss(animated: true, completion: nil)
        
    }
    @IBOutlet weak var tapenter: UILabel!
    @IBAction func tapOk(_ sender: Any) {
        
        tapok.alpha = 0

        if answers.count > counter {
            
            answers[counter] = tf.text!

        } else {
            
            answers.append(tf.text!)
        }
        
        counter += 1
        tapformer.alpha = 1
        question.text = questions[counter]
        tf.text = ""

        tf.placeholder = "Type your answer here..."
        tf.becomeFirstResponder()
        
        if counter == questions.count {
            
            tapbook.alpha = 1
        } else {
            
            tapbook.alpha = 1

        }
        
    }
    @IBAction func tapBuy(_ sender: Any) {
        
    ref!.child("Users").child(selectedid).child("Applications").childByAutoId().updateChildValues(["Status" : "Not Approved", "Name" : answers[0], "Age" : answers[1], "Phone" : answers[2], "Time Zone" : answers[3], "Email" : answers[4], "IG" : answers[5], "Goal" : answers[6], "Challenge" : answers[7], "Seriousness" : answers[8], "Investment" : answers[9]])
        
        self.performSegue(withIdentifier: "ApplyToThanks", sender: self)
    }
    @IBAction func tapFormer(_ sender: Any) {
        
        counter -= 1
        question.text = questions[counter]
        tf.text = answers[counter]
        
        
        if counter == questions.count {
            
            tapbook.alpha = 1
            
        } else {
            
            tapbook.alpha = 1
            
        }
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if (textField.text?.isEmpty)! {
            
            tapok.alpha = 0
        } else {
            
            tapok.alpha = 1

        }
        
        return true
    }
    @IBOutlet weak var tapbook: UIButton!
    @IBOutlet weak var tf: UITextField!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var tapok: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        tf.becomeFirstResponder()
        tapok.layer.cornerRadius = 22.0
        tapok.layer.masksToBounds = true
        
        questions.append("What is your name?")
        questions.append("What is your age?")
        questions.append("What is your phone number?")
        questions.append("What time zone do you live in?")
        questions.append("What is your email address?")
        questions.append("What is your instagram handle?")
        questions.append("What is your #1 fitness or health goal that you wish to accomplish in the next 6-12 months?")
        questions.append("What do you struggle with in terms of reaching this goal?")
        questions.append("On a scale of 1 - 5, how important is it for you to overcome your fitness and health obstacles?")
        questions.append("Are you willing to make an investment in yourself to hire a coach?")
tapformer.alpha = 0
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var tapformer: UIButton!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
