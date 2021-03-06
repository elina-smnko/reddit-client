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
    
    private let viewModel = PostViewModel()
    
    private var post = RedditPost()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.loadOnePost(subreddit: Subreddit.FoodPorn, sorting: Sorting.top, parameters: [Parameters.limit : "1"], completion: { (post) in
            DispatchQueue.main.async {
                self.showPost(post: post)
                self.post = post
            }
        })
    }
    
    func showPost(post: RedditPost){
        self.usernameLabel.text = post.username
        self.timeLabel.text = "\(Int(Date().timeIntervalSince(post.time)/3600))h"
        self.domainLabel.text = post.domain
        self.titleLabel.text = post.title
        self.ratingLabel.text = "↑\(post.rating)"
        self.commentsLabel.text = "\(post.num_comments)"
        

        imageView.sd_setImage(with: URL(string: post.imageLink), placeholderImage: UIImage(named: "placeholder"))
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        if !post.saved {
            saveButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
        } else {
           saveButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
        }
        post.saved = !post.saved
    }
    
    @IBAction func shareTapped(_ sender: Any) {
    }
    

}
