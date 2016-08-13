//
//  DetailViewController.swift
//  Yelp
//
//  Created by Shakeeb Majid on 6/27/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit
import AFNetworking

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var thumnailView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ratingsView: UIImageView!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var categoriesLabel: UILabel!
    
    @IBOutlet weak var reviewCountLabel: UILabel!
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var tableControl: UISegmentedControl!
    
    var business : Business?
    
    var reviews: [NSDictionary]?
    
    var similar: [Business]? = []
    
    var categories: [String]? = []
    
    var controlVal = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120

        nameLabel.text = business!.name
        if business!.imageURL != nil {
            thumnailView.setImageWithURL(business!.imageURL!)
            
        }
        distanceLabel.text = business!.distance!
        
        categoriesLabel.text = business!.categories
        
        addressLabel.text = business!.address
        reviewCountLabel.text = "\(business!.reviewCount!) Reviews"
        
        ratingsView.setImageWithURL(business!.ratingImageURL!)
        
        //print(self.business!.dictionary!)
        Business.businessWithID(business!.dictionary!["id"] as! String, completion: { (business: NSDictionary!, error: NSError!) -> Void in
           //print("helllloeweifwooweieieieieiieieieiieieiieieieiieieiieieieie")
            //print("business: \(business)")
            
            self.reviews = business["reviews"] as! [NSDictionary]
            self.tableView.reloadData()
            print("reviews: \(self.reviews!)")
            if let error = error {
                print("Error: \(error)")
            }
            
        })
        
        var categoryArray = business!.dictionary!["categories"] as! [[String]]
        
        for category in categoryArray {
            self.categories!.append(category[1])
        }
        
        Business.searchWithTerm("Thai", sort: nil, categories: self.categories, deals: nil, completion: { (businesses: [Business]?, error: NSError?) -> Void in
            if let businesses = businesses {
                //print("success")
                for business in businesses {
                    self.similar!.append(business)
                }
                //self.isMoreDataLoading = false
                //print("simliar1: \(self.similar!)")
                //self.businesses = businesses
                self.tableView.reloadData()
            } else if let error = error {
                print("error: \(error)")
            }
            
        })

        
        
        
        //print(business!.dictionary!["id"] as! String)
        
        
        //print("hey right before the reviews")
        //reviews = business!.dictionary!["reviews"] as! [NSDictionary]
        
        tableView.reloadData()
        
        //distanceLabel.text = business.distance

        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print("rows tableControl: \(controlVal)")
        
        if controlVal == 0 {
            //print("table control is 0")
            if let reviews = reviews {
                //print("hello you reached 0 count: \(reviews.count)")
                return reviews.count
            } else {
                return 0
            }
        }
        
        if controlVal == 1 {
            if let similar = similar {
                return similar.count
            } else {
                return 0
            }
            
        }
        
        if controlVal == 2 {
            
            
        }
        
        return 0
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if controlVal == 0 {
            //print("new review cell")
            let cell = tableView.dequeueReusableCellWithIdentifier("ReviewCell", forIndexPath: indexPath) as! ReviewCell
            
            cell.review = reviews![indexPath.row]
            
            
            
            return cell
        }
        
        if controlVal == 1 {
            //print("new similar cell")
            
            let cell = tableView.dequeueReusableCellWithIdentifier("BusinessCell", forIndexPath: indexPath) as! BusinessCell
            //print("wow")
            //print("similar: \(similar!)")
            //print("indexPath: \(indexPath)")
            //print("single similar: \(similar![indexPath.row])")
            cell.business = similar![indexPath.row]
            //print("crzay")
            return cell
            
            
        }
        
        if controlVal == 2 {
            
            
        }
        
        let cell = tableView.dequeueReusableCellWithIdentifier("BusinessCell")
        
        return cell!
        
    }
    
    @IBAction func onControlChange(sender: AnyObject) {
        controlVal = tableControl.selectedSegmentIndex
        tableView.reloadData()
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let similarDetailView = segue.destinationViewController as! DetailViewController
        let sendingBusiness = (sender as! BusinessCell).business
        
        similarDetailView.business = sendingBusiness
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
