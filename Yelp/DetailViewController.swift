//
//  DetailViewController.swift
//  Yelp
//
//  Created by Shakeeb Majid on 6/27/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var business : Business?

    @IBOutlet weak var snippetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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