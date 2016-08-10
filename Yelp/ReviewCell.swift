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
    
    @IBOutlet weak var timestampLabel: UILabel!
    
    var review: NSDictionary! {
        
        didSet{
            //nameLabel.text = business.name
           print("review cell review: \(review)")
            print("before label")
            let user = review["user"] as! NSDictionary
            
            usernameLabel.text = user["name"] as! String
            
            ratingsView.setImageWithURL(NSURL(string: review["rating_image_url"] as! String)!)
            var timeCreated = NSDate(timeIntervalSince1970: review["time_created"] as! Double)
            print("elapsed time: \(timeElapsed(timeCreated))")
            print("time created: \(timeCreated)")
            print("before content")
            contentLabel.text = review["excerpt"] as! String
            
            
            print("before image")
            userImageView.setImageWithURL(NSURL(string: user["image_url"] as! String)!)
            
            timestampLabel.text = timeElapsed(timeCreated)
            
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

    
    func timeElapsed(date: NSDate) -> String {
        
        let timeElapsed = Int(0 - date.timeIntervalSinceNow)
        print(timeElapsed)
        
        let secondsInMinute = 60
        let secondsInHour = secondsInMinute * 60
        let secondsInDay = secondsInHour * 24
        let secondsInMonth = secondsInDay * 30
        let monthsElapsed = timeElapsed/secondsInMonth
        let daysElapsed = timeElapsed/secondsInDay
        let hoursElapsed = timeElapsed/secondsInHour
        let minutesElapsed = timeElapsed/secondsInMinute
        let secondsElapsed = timeElapsed
        var timeElapsedString: String?
        
        if monthsElapsed != 0 {
            timeElapsedString = "\(monthsElapsed)mon"
            
        } else if daysElapsed != 0 {
            timeElapsedString = "\(daysElapsed)d"
            
            
        } else if hoursElapsed != 0 {
            timeElapsedString = "\(hoursElapsed)h"
            
            
        } else if minutesElapsed != 0 {
            timeElapsedString = "\(minutesElapsed)m"
            
        } else {
            timeElapsedString = "\(secondsElapsed)s"
            
            
        }
        
        return timeElapsedString!
        
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
