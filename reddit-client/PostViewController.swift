//
//  PostViewController.swift
//  reddit-client
//
//  Created by Элина on 03.11.2020.
//  Copyright © 2020 Элина. All rights reserved.
//

import UIKit
import SDWebImage

class PostViewController: UIViewController {
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var domainLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        PostViewModel.shared.loadOnePost(subreddit: Subreddit.FoodPorn, sorting: Sorting.top, parameters: [Parameters.limit : "1"], completion: { (post) in
            DispatchQueue.main.async {
                self.showPost(post: post)
            }
        })
    }
    
    func showPost(post: RedditPost){
        self.usernameLabel.text = post.username
        self.timeLabel.text = "\(round(Date().timeIntervalSince(post.time)/3600))h"
        self.domainLabel.text = post.domain
        //TODO: saved state
        self.titleLabel.text = post.title
        self.ratingLabel.text = "↑\(post.rating)"
        self.commentsLabel.text = "\(post.num_comments)"
        

        imageView.sd_setImage(with: URL(string: post.imageLink), placeholderImage: nil)
    }
    
    @IBAction func saveTapped(_ sender: Any) {
    }
    
    @IBAction func shareTapped(_ sender: Any) {
    }
    

}
