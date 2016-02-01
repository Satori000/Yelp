
//
//  BusinessCell.swift
//  Yelp
//
//  Created by Shakeeb Majid on 1/31/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var thumbnailView: UIImageView!
    
    @IBOutlet weak var ratingsView: UIImageView!
    
    @IBOutlet weak var reviewsLabel: UILabel!
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var categoriesLabel: UILabel!
    
    
    
    var business: Business! {
        didSet{
            nameLabel.text = business.name
            thumbnailView.setImageWithURL(business.imageURL!)
            
            categoriesLabel.text = business.categories
            addressLabel.text = business.address
            reviewsLabel.text = "\(business.reviewCount!) Reviews"
            ratingsView.setImageWithURL(business.ratingImageURL!)
            //print(business.ratingImageURL)
            //print(business.imageURL)
            
        }
       
        
        
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
        
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
