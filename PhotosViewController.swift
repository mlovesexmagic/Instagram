//
//  PhotosViewController.swift
//  Instagram
//
//  Created by Zhipeng Mei on 1/21/16.
//  Copyright © 2016 Zhipeng Mei. All rights reserved.
//

import UIKit
import AFNetworking

class PhotosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var instagrams: [NSDictionary]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 320;
        tableView.delegate = self
        tableView.dataSource = self
        
        fetchInstagramAPI()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchInstagramAPI() {
        let clientId = "e05c462ebd86446ea48a5af73769b602"
        let url = NSURL(string:"https://api.instagram.com/v1/media/popular?client_id=\(clientId)")
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession(
            configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
            delegate:nil,
            delegateQueue:NSOperationQueue.mainQueue()
        )
        
        let task : NSURLSessionDataTask = session.dataTaskWithRequest(request,
            completionHandler: { (dataOrNil, response, error) in
                if let data = dataOrNil {
                    if let responseDictionary = try! NSJSONSerialization.JSONObjectWithData(
                        data, options:[]) as? NSDictionary {
                            NSLog("response: \(responseDictionary)")
                            
                            self.instagrams = responseDictionary["data"] as? [NSDictionary]
    
                            self.tableView.reloadData()
                            
                            
                    }
                }
        });
        task.resume()
    }
    
    
    //return 1
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
        
    }
    
    
    //returns the number of photos
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        if let instagram = instagrams {
            return instagram.count
        }else{
            return 0
        }
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("InstagramCell", forIndexPath: indexPath) as! InstagramCell
        
        //indexPath.section because section is increasing and indexPath.row remains at 0
        let instagram = instagrams![indexPath.section]
        
        let imagePath = instagram.valueForKeyPath("images.low_resolution.url") as! String
        let imageURL = NSURL(string: imagePath)
        cell.posterView.setImageWithURL(imageURL!)
    
        print("row \(indexPath.row)")
        print("section \(indexPath.section)")
        
        return cell
    }
    
 
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        headerView.backgroundColor = UIColor(white: 1, alpha: 0.9)
        
        let profileView = UIImageView(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
        profileView.clipsToBounds = true
        profileView.layer.cornerRadius = 15;
        profileView.layer.borderColor = UIColor(white: 0.7, alpha: 0.8).CGColor
        profileView.layer.borderWidth = 1;
        
        // Use the section number to get the right URL
        //profileView.setImageWithURL(...)
        
        headerView.addSubview(profileView)
        
        // Add a UILabel for the username here        

        
        return headerView
  
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
}
