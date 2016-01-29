//
//  PhotoDetailsViewController.swift
//  Instagram
//
//  Created by Zhipeng Mei on 1/26/16.
//  Copyright © 2016 Zhipeng Mei. All rights reserved.
//

import UIKit

class PhotoDetailsViewController: UIViewController {

    @IBOutlet weak var detailsPosterView: UIImageView!
    
    var detailsInstagram: NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let posterViewURL = detailsInstagram.valueForKeyPath("images.low_resolution.url") as! String
        let imageURL = NSURL(string: posterViewURL)
        detailsPosterView.setImageWithURL(imageURL!)
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
