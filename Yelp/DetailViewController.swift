//
//  DetailViewController.swift
//  Yelp
//
//  Created by Shakeeb Majid on 6/27/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit
import AFNetworking

class DetailViewController: UIViewController {
    
    @IBOutlet weak var thumnailView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ratingsView: UIImageView!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var categoriesLabel: UILabel!
    
    @IBOutlet weak var reviewCountLabel: UILabel!
    
    @IBOutlet weak var snippetLabel: UILabel!
    
    var business : Business?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = business!.name
        if business!.imageURL != nil {
            thumnailView.setImageWithURL(business!.imageURL!)
            
        }
        
        categoriesLabel.text = business!.categories
        
        addressLabel.text = business!.address
        reviewCountLabel.text = "\(business!.reviewCount!) Reviews"
        
        ratingsView.setImageWithURL(business!.ratingImageURL!)
        
        //distanceLabel.text = business.distance

        
        snippetLabel.text = business!.snippetText
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
