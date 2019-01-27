//
//  OverviewViewController.swift
//  Fitness eBook Marketplace
//
//  Created by Alek Matthiessen on 1/16/19.
//  Copyright © 2019 The Matthiessen Group, LLC. All rights reserved.
//

import UIKit

class OverviewViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Overview", for: indexPath) as! OverviewCollectionViewCell
        
        cell.layer.cornerRadius = 5.0
        cell.layer.masksToBounds = true
        cell.mainimage.image = images[indexPath.row]
        cell.name.text = names[indexPath.row]
        
        return cell
        
    }
    

    var names = [String]()
    
    @IBOutlet weak var taps: UIButton!
    @IBOutlet weak var tapr: UIButton!
    @IBOutlet weak var TAPJOIN: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        images.removeAll()
        taps.layer.cornerRadius = 22.0
        taps.layer.masksToBounds = true
        
        //        TAPJOIN.frame = CGRect(x: 0, y: TAPJOIN.frame.minY, width: self.view.frame.width/2, height: 76)
        //        self.view.addSubview(TAPJOIN)
        
        images.append(UIImage(named: "1")!)
        images.append(UIImage(named: "2")!)
        
        
        images.append(UIImage(named: "3")!)
        images.append(UIImage(named: "4")!)
        images.append(UIImage(named: "5")!)
        images.append(UIImage(named: "6")!)
        images.append(UIImage(named: "7")!)
        images.append(UIImage(named: "8")!)

        names.append("Johanna Sophia")
        names.append("Danielle Robertson")
        names.append("Kathy Stephens")
        names.append("Laura Michelle")
        names.append("Chris Clark")
        names.append("Jason Poston")
        names.append("Jordan Strick")
        names.append("Cody Messner")
        
        
//        setupimage.image = UIImage(named: "Setup\(counter)")
//        let swipeRightRec = UISwipeGestureRecognizer()
//        let swipeLeftRec = UISwipeGestureRecognizer()
//        let swipeUpRec = UISwipeGestureRecognizer()
//        let swipeDownRec = UISwipeGestureRecognizer()
//
//        swipeRightRec.addTarget(self, action: #selector(self.swipeR) )
//        swipeRightRec.direction = .right
//        self.view!.addGestureRecognizer(swipeRightRec)
//
//
//        swipeLeftRec.addTarget(self, action: #selector(self.swipeL) )
//        swipeLeftRec.direction = .left
//        self.view!.addGestureRecognizer(swipeLeftRec)
        
    }
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return images.count
    }
    
    var images = [UIImage]()
 
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
extension UIView {
    // Name this function in a way that makes sense to you...
    // slideFromLeft, slideRight, slideLeftToRight, etc. are great alternative names
    func slideInFromLeft(duration: TimeInterval = 0.5, completionDelegate: AnyObject? = nil) {
        // Create a CATransition animation
        let slideInFromLeftTransition = CATransition()
        
        // Set its callback delegate to the completionDelegate that was provided (if any)
        if let delegate: AnyObject = completionDelegate {
            slideInFromLeftTransition.delegate = delegate as! CAAnimationDelegate
        }
        
        // Customize the animation's properties
        slideInFromLeftTransition.type = CATransitionType.push
        slideInFromLeftTransition.subtype = CATransitionSubtype.fromLeft
        slideInFromLeftTransition.duration = duration
        slideInFromLeftTransition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        slideInFromLeftTransition.fillMode = CAMediaTimingFillMode.removed
        
        // Add the animation to the View's layer
        self.layer.add(slideInFromLeftTransition, forKey: "slideInFromLeftTransition")
    }
    
    func slideInFromRight(duration: TimeInterval = 0.5, completionDelegate: AnyObject? = nil) {
        // Create a CATransition animation
        let slideInFromRightTransition = CATransition()
        
        // Set its callback delegate to the completionDelegate that was provided (if any)
        if let delegate: AnyObject = completionDelegate {
            slideInFromRightTransition.delegate = delegate as! CAAnimationDelegate
        }
        
        // Customize the animation's properties
        slideInFromRightTransition.type = CATransitionType.push
        slideInFromRightTransition.subtype = CATransitionSubtype.fromRight
        slideInFromRightTransition.duration = duration
        slideInFromRightTransition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        slideInFromRightTransition.fillMode = CAMediaTimingFillMode.removed
        
        // Add the animation to the View's layer
        self.layer.add(slideInFromRightTransition, forKey: "slideInFromRightTransition")
    }
}
extension UIButton{
    
    func addTextSpacing(_ letterSpacing: CGFloat){
        let attributedString = NSMutableAttributedString(string: (self.titleLabel?.text!)!)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: letterSpacing, range: NSRange(location: 0, length: (self.titleLabel?.text!.count)!))
        self.setAttributedTitle(attributedString, for: .normal)
    }
    
}
