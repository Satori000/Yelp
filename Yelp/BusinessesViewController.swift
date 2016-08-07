//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {

    var businesses: [Business]!
    var searchController: UISearchController!
    var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var filteredData: [String]!
    var isMoreDataLoading = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar = UISearchBar()
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar
        
            
            
            
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
        
        
        Business.searchWithTerm("Thai", completion: { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            self.tableView.reloadData()
            for business in businesses {
                //print(business.name!)
                //print(business.address!)
            }
        })

/* Example of Yelp search with more search options specified
        Business.searchWithTerm("Restaurants", sort: .Distance, categories: ["asianfusion", "burgers"], deals: true) { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            
            for business in businesses {
                print(business.name!)
                print(business.address!)
            }
        }
*/
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if businesses != nil {
            print(businesses!.count)
            
            return businesses!.count
        } else {
            return 0
        }
        
        
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print("BEFORE cell initialized")

        let cell = tableView.dequeueReusableCellWithIdentifier("BusinessCell", forIndexPath: indexPath) as! BusinessCell
        print("BEFORE business set")
        print("index path: \(indexPath), count: \(businesses!.count)")
        cell.business = businesses[indexPath.row]
        
        print("dictionary \(cell.business.dictionary!)")
        
        return cell
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // Handle scroll behavior here
        print("hello")
        if (!isMoreDataLoading) {
            
            print("hello 0")
            let scrollViewContentHeight = tableView.contentSize.height
            let scrollOffsetThreshold = scrollViewContentHeight - tableView.bounds.size.height
            print("hello 0.5")

            // When the user has scrolled past the threshold, start requesting
            if(scrollView.contentOffset.y > scrollOffsetThreshold && tableView.dragging) {
                isMoreDataLoading = true
                 print("hello1")
                loadMoreData()
                // ... Code to load more results ...
            }
            
            
            // ... Code to load more results ...
            
        }
        
        
        
        
        
        
    }
    
    func loadMoreData() {
         print("hello2")
        Business.searchWithTerm("Thai", offset: businesses.count, completion: { (businesses: [Business]?, error: NSError?) -> Void in
            if let businesses = businesses {
                print("success")
                for business in businesses {
                    self.businesses.append(business)
                }
                self.isMoreDataLoading = false
                
                //self.businesses = businesses
                self.tableView.reloadData()
            } else if let error = error {
                print("error: \(error)")
            }
           
        })
        
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let sender = sender as? UITableViewCell {
            let cell = sender as! BusinessCell
            let business = cell.business
            
            let detailVC = segue.destinationViewController as! DetailViewController
            
            detailVC.business = business
            
            
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}







// ... Create the NSURLRequest (myRequest) ...
/*var myRequest = Business.searchWithTerm("Thai", offset: businesses.count, completion: { (businesses: [Business]!, error: NSError!) -> Void in
 self.businesses = businesses
 self.tableView.reloadData()
 for business in businesses {
 print(business.name!)
 print(business.address!)
 }
 }) as! NSURLRequest
 
 print("hello3")
 
 
 // Configure session so that completion handler is executed on main UI thread
 let session = NSURLSession(
 configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
 delegate:nil,
 delegateQueue:NSOperationQueue.mainQueue()
 )
 
 let task : NSURLSessionDataTask = session.dataTaskWithRequest(myRequest,
 completionHandler: { (data, response, error) in
 
 // Update flag
 self.isMoreDataLoading = false
 
 // ... Use the new data to update the data source ...
 
 // Reload the tableView now that there is new data
 self.tableView.reloadData()
 });
 task.resume() */

