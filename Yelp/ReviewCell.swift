//
//  ReviewCell.swift
//  Yelp
//
//  Created by Shakeeb Majid on 8/7/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

class ReviewCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var ratingsView: UIImageView!

    @IBOutlet weak var contentLabel: UILabel!
    
    var review: NSDictionary! {
        didSet{
            //nameLabel.text = business.name
            userImageView.setImageWithURL(NSURL(string: review["image_url"] as! String)!)
            
            usernameLabel.text = review["name"] as! String
            
            ratingsView.setImageWithURL(NSURL(string: review["rating_image_url"] as! String)!)
            
            contentLabel.text = review["excerpt"] as! String
            
            
            
            
        }
        
        
       /* "reviews": [
        {
        "excerpt": "One of the owners is a former Sherpa from Nepal who has summitted Mt. Everest twice. While the restaurant is in a seeder part of the City, it's also on one...",
        "id": "flAK8Mu4auUdcFNR7iPa6Q",
        "rating": 4,
        "rating_image_large_url": "http://s3-media2.fl.yelpcdn.com/assets/2/www/img/ccf2b76faa2c/ico/stars/v1/stars_large_4.png",
        "rating_image_small_url": "http://s3-media4.fl.yelpcdn.com/assets/2/www/img/f62a5be2f902/ico/stars/v1/stars_small_4.png",
        "rating_image_url": "http://s3-media4.fl.yelpcdn.com/assets/2/www/img/c2f3dd9799a5/ico/stars/v1/stars_4.png",
        "time_created": 1440895245,
        "user": {
        "id": "3KNNxsQa4uooK5FAj7bVaQ",
        "image_url": "http://s3-media3.fl.yelpcdn.com/photo/hk31BkJvJ8qcqoUvZ38rmQ/ms.jpg",
        "name": "Hilary C."
        }
        }
        ] */
        
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
