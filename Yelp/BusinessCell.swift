
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
            print("before name")
            nameLabel.text = business.name
            print("before thumbnail")
            print(business.imageURL)
            if business.imageURL != nil {
                thumbnailView.setImageWithURL(business.imageURL!)

            }
            //thumbnailView.setImageWithURL(business.imageURL!)
            print("before categories")

            categoriesLabel.text = business.categories
            print("before address")

            addressLabel.text = business.address
            print("before reviews")

            reviewsLabel.text = "\(business.reviewCount!) Reviews"
            print("before ratings")

            ratingsView.setImageWithURL(business.ratingImageURL!)
            print("before distance")

            distanceLabel.text = business.distance
            
        }
       
        
        
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
        
        
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
        
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
