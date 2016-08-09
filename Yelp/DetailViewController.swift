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
    
    @IBOutlet weak var snippetLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var business : Business?
    
    var reviews: [NSDictionary]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        nameLabel.text = business!.name
        if business!.imageURL != nil {
            thumnailView.setImageWithURL(business!.imageURL!)
            
        }
        
        categoriesLabel.text = business!.categories
        
        addressLabel.text = business!.address
        reviewCountLabel.text = "\(business!.reviewCount!) Reviews"
        
        ratingsView.setImageWithURL(business!.ratingImageURL!)
        
        Business.businessWithID(business!.dictionary!["id"] as! String, completion: { (business: NSDictionary!, error: NSError!) -> Void in
           print("helllloeweifwooweieieieieiieieieiieieiieieieiieieiieieieie")
            print("business: \(business)")
            
            if let error = error {
                print("Error: \(error)")
            }
            
        })
        
        
        
        
        print(business!.dictionary!["id"] as! String)
        
        
        print("hey right before the reviews")
        //reviews = business!.dictionary!["reviews"] as! [NSDictionary]
        
        tableView.reloadData()
        
        //distanceLabel.text = business.distance

        
        snippetLabel.text = business!.snippetText
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let reviews = reviews {
            
            return reviews.count
        } else {
            return 0
        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ReviewCell", forIndexPath: indexPath) as! ReviewCell
        
        cell.review = reviews![indexPath.row]
        
        
        
        return cell
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
