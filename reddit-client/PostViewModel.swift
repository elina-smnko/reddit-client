//
//  PostViewModel.swift
//  reddit-client
//
//  Created by Элина on 03.11.2020.
//  Copyright © 2020 Элина. All rights reserved.
//

import Foundation

class PostViewModel {
    
    static var shared: PostViewModel = {
        let instance = PostViewModel()
        return instance
    }()
    
    func loadOnePost(subreddit: Subreddit, sorting: Sorting, parameters: [Parameters:String], completion: @escaping (RedditPost)->()){
        UseCase().request(subreddit: subreddit, sorting: sorting, parameters: parameters, completion: {(res) in
            if let post = res.last {
                completion(post)
            }
        })
    }
    
    
}
