//
//  ProductOverviewViewController.swift
//  Fitness eBook Marketplace
//
//  Created by Alek Matthiessen on 1/17/19.
//  Copyright © 2019 The Matthiessen Group, LLC. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCore
import FBSDKCoreKit
import StoreKit
import UserNotifications
import FirebaseInstanceID
import FirebaseMessaging
import UXCam
import AVFoundation
import Purchases

var selectedreviews = String()
class ProductOverviewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    @IBOutlet weak var background: UILabel!
    
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Overview", for: indexPath) as! OverviewTableViewCell
        
//        cell.a.addCharacterSpacing()
//        cell.b.addCharacterSpacing()
//        cell.c.addCharacterSpacing()
//        cell.d.addCharacterSpacing()
//        cell.e.addCharacterSpacing()
//        cell.f.text = "REVIEWS (\(selectedreviews))"
//        cell.f.addCharacterSpacing()
        
        cell.t1.layer.cornerRadius = 9.0
        cell.t1.layer.masksToBounds = true
        cell.t2.layer.cornerRadius = 9.0
        cell.t2.layer.masksToBounds = true
        cell.t3.layer.cornerRadius = 9.0
        cell.t3.layer.masksToBounds = true
        cell.t4.layer.cornerRadius = 9.0
        cell.t4.layer.masksToBounds = true
        cell.t5.layer.cornerRadius = 9.0
        cell.t5.layer.masksToBounds = true
        cell.t6.layer.cornerRadius = 9.0
        cell.t6.layer.masksToBounds = true
        
        if thumbnails.count > indexPath.row {
            
            cell.t1.image = thumbnails[0]
            cell.t2.image = thumbnails[1]
            cell.t3.image = thumbnails[2]
            cell.t4.image = thumbnails[3]
            cell.t5.image = thumbnails[4]
            cell.t6.image = thumbnails[5]
            
        }
        cell.authorlabel.text = selectedauthor
        cell.mainimage.image = selectedimage
//        cell.titlelabel.text = selectedtitle
        cell.descriptionlabel.text = selecteddescription
        cell.reviews.text = "\(selectedreviews) reviews"

//        cell.goal.text = goals
        cell.review1.text = review1s
//        cell.review2.text = review2s
//        cell.review3.text = review3s
        cell.date1.text = date1s
//        cell.date2.text = date2s
//        cell.date3.text = date3s
        cell.name1.text = name1s
//        cell.name2.text = name2s
//        cell.name3.text = name3s
//        cell.weeks.text = weekss
//        cell.days.text = dayss
//        cell.minutes.text = minutess
//        cell.level.text = levels
        
        cell.writereview.layer.borderColor = UIColor.black.cgColor
        cell.writereview.layer.borderWidth = 1.0
        cell.mainimage.layer.cornerRadius = cell.mainimage.frame.width/2
        cell.mainimage.clipsToBounds = true
        cell.reviewss.text = "\(selectedreviews) reviews"
//        if Auth.auth().currentUser == nil {
//
//            cell.writereview.alpha  = 0
//
//        }  else {
//
//            cell.writereview.alpha  = 1
//        }
        return cell
    }
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func tapBack(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var newprice: UILabel!
    
        var purchases = RCPurchases(apiKey: "jLMuZLatPMLmTSoFKkaVNnTyXyAqYuaP")
    
    @IBOutlet weak var oldprice: UILabel!
    @IBAction func tapBuy(_ sender: Any) {
        
    
        self.performSegue(withIdentifier: "ProductToApply", sender: self)
        
    }
    
    var thumbnails = [UIImage]()
    func queryforshare() {
        
                thumbnails.removeAll()
                
                ref?.child("Plans").child(selectedgenre).child(selectedid).observeSingleEvent(of: .value, with: { (snapshot) in
                    
                    var value = snapshot.value as? NSDictionary
                    
                    
                    
                    if var author2 = value?["Author"] as? String {
                        selectedauthor = author2
                        
                    }
                    
                    if var author2 = value?["Description"] as? String {
                        
                        selecteddescription = author2
                    }
                    
                    if var author2 = value?["New Price"] as? String {
                        selectedprice = author2
                        
                    }
                    
                    if var author2 = value?["Reviews"] as? String {
                        selectedreviews = author2
                        
                    }
                    
                    if var author2 = value?["Link"] as? String {
                        selectedlink = author2
                        
                    }
                    if var author2 = value?["Title"] as? String {
                        selectedtitle = author2
                        
                    }
                    
                    
                    if var author2 = value?["URL"] as? String {
                        self.selectedshareurl = author2
                        
                    }
                    
                    if var author2 = value?["Review1"] as? String {
                        review1s = author2
                        
                    }
                    
                    if var author2 = value?["Date1"] as? String {
                        date1s = author2
                        
                    }
                    
                    if var author2 = value?["Name1"] as? String {
                        name1s = author2
                        
                    }
                    
                    if var profileUrl = value?["Image"] as? String {
                        // Create a storage reference from the URL
                        
                        let url = URL(string: profileUrl)
                        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                        selectedimage = UIImage(data: data!)!
                        
                    }
                    
                    if var profileUrl = value?["t1"] as? String {
                        // Create a storage reference from the URL
                        
                        let url = URL(string: profileUrl)
                        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                        var selectedimage = UIImage(data: data!)!
                        
                        self.thumbnails.append(selectedimage)
                        
                    }
                    
                    if var profileUrl = value?["t6"] as? String {
                        // Create a storage reference from the URL
                        
                        let url = URL(string: profileUrl)
                        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                        var selectedimage = UIImage(data: data!)!
                        
                        self.thumbnails.append(selectedimage)
                        
                    }
                    
                    
                    if var profileUrl = value?["t2"] as? String {
                        // Create a storage reference from the URL
                        
                        let url = URL(string: profileUrl)
                        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                        var selectedimage = UIImage(data: data!)!
                        
                        self.thumbnails.append(selectedimage)
                        
                    }
                    
                    
                    if var profileUrl = value?["t3"] as? String {
                        // Create a storage reference from the URL
                        
                        let url = URL(string: profileUrl)
                        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                        var selectedimage = UIImage(data: data!)!
                        
                        self.thumbnails.append(selectedimage)
                        
                    }
                    
                    
                    if var profileUrl = value?["t4"] as? String {
                        // Create a storage reference from the URL
                        
                        let url = URL(string: profileUrl)
                        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                        var selectedimage = UIImage(data: data!)!
                        
                        self.thumbnails.append(selectedimage)
                        
                    }
                    
                    
                    if var profileUrl = value?["t5"] as? String {
                        // Create a storage reference from the URL
                        
                        let url = URL(string: profileUrl)
                        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                        var selectedimage = UIImage(data: data!)!
                        
                        self.thumbnails.append(selectedimage)
                        self.tableView.reloadData()
                    }
                    
                    
                    
              
                })
    
    
        
    }
    
    func queryforreviewinfo() {
        
        var functioncounter = 0
            
            ref?.child("Plans").child(selectedgenre).child(selectedid).observeSingleEvent(of: .value, with: { (snapshot) in
                
                var value = snapshot.value as? NSDictionary
                
                
                
                if var author2 = value?["Level"] as? String {
                    levels = author2
                    
                }
          
                if var author2 = value?["Goal"] as? String {
                    goals = author2
                    
                }
              
                if var author2 = value?["Review2"] as? String {
                    review2s = author2
                    
                }
                if var author2 = value?["Review3"] as? String {
                    review3s = author2
                    
                }
              
                if var author2 = value?["Date2"] as? String {
                    date2s = author2
                    
                }
                if var author2 = value?["Date3"] as? String {
                    date3s = author2
                    
                }
             
                
                if var author2 = value?["Name2"] as? String {
                    name2s = author2
                    
                }
                
                if var author2 = value?["Name3"] as? String {
                    name3s = author2
                    
                }
           
                
                if var author2 = value?["Weeks"] as? String {
                    weekss = author2
                    
                }
                
                if var author2 = value?["Days"] as? String {
                    dayss = author2
                    
                }
                
                if var author2 = value?["Minutes"] as? String {
                    minutess = author2
                    
                }
                
              
                self.tableView.reloadData()
                
        })
        
    }
    
    func queryforuser() {
        
        ref?.child("Users").child(uid).child("Credit Card").observeSingleEvent(of: .value, with: { (snapshot) in
            
            var value = snapshot.value as? NSDictionary
            
            if var author2 = value?["Number"] as? String {
                
                self.performSegue(withIdentifier: "ProductToPurchase", sender: self)
                
                
            } else {
                
                self.showalert()
                
            }
            
        })
        
    }
    
    func showalert() {
        
        
    }
    var selectedshareurl = String()
                
    @IBAction func tapShare(_ sender: Any) {
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        
        alert.addAction(UIAlertAction(title: "Share This Plan", style: .default, handler: { action in
            switch action.style{
            case .default:
                
                let text = "\(selectedtitle) on Coach"
                
                var image = UIImage()
//                if thumbnails.count > 0 {
//
//                    image = thumbnails[videoids[0]]!
//
//                } else {
//
//                    image = UIImage(named: "FamLogo")!
//
//                }
//
                image = selectedimage
                
                let myWebsite = NSURL(string: self.selectedshareurl)
                let shareAll : Array = [myWebsite] as [Any]
                
                
                let activityViewController = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
                
                activityViewController.excludedActivityTypes = [UIActivity.ActivityType.print, UIActivity.ActivityType.postToWeibo, UIActivity.ActivityType.addToReadingList, UIActivity.ActivityType.postToVimeo, UIActivity.ActivityType.saveToCameraRoll, UIActivity.ActivityType.assignToContact]
                
                activityViewController.popoverPresentationController?.sourceView = self.view
                self.present(activityViewController, animated: true, completion: nil)
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
                
                
            }}))
        present(alert, animated: true)
        
        
    }
    @IBOutlet weak var tapbuy: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()
        queryforuser()
        newprice.text = selectedprice
        tapbuy.layer.cornerRadius = 22.0
        tapbuy.layer.masksToBounds = true
//        queryforreviewinfo()
//        background.layer.shadowRadius = 10.0
//        background.layer.shadowOpacity = 1.0
//        background.layer.shadowOffset = CGSize(width: 4, height: 4)
//        background.layer.masksToBounds = false        // Do any additional setup after loading the view.
        

//        if selectedauthor == "" {
        
            queryforshare()
//        }
        
     
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
