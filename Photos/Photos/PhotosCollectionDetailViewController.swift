//
//  PhotosCollectionDetailViewController.swift
//  Photos
//
//  Created by Emilie Gao on 4/11/16.
//  Copyright © 2016 iOS DeCal. All rights reserved.
//


import UIKit

class PhotosCollectionsDetailsViewController: UIViewController {
    
    var photo: Photo!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var numLikes: UILabel!
    @IBOutlet weak var liked: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImage(self.photo, imageView: self.imageView)
        self.username.text = "Username: " + self.photo.username
        self.date.text = "Date Uploaded: \(self.photo.dateText)"
        self.numLikes.text = "Likes: \(self.photo.likes)"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadImage(photo: Photo, imageView: UIImageView) {
        let task = NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: photo.url)!) {
            (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            if error == nil {
                imageView.image = UIImage(data: data!)
            }
        }
        task.resume()
    }
    
    @IBAction func likePicture(sender: AnyObject) {
        if self.liked.titleLabel!.text == "♡" {
            self.liked.setTitle("♥", forState: UIControlState.Normal)
            self.photo.isLiked = true
            self.numLikes.text = "Likes: \(self.photo.likes + 1)"
        } else {
            self.liked.setTitle("♡", forState: UIControlState.Normal)
            self.photo.isLiked = false
            self.numLikes.text = "Likes: \(self.photo.likes)"
        }
    }
    
}
