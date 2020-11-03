//
//  UseCase.swift
//  reddit-client
//
//  Created by Элина on 03.11.2020.
//  Copyright © 2020 Элина. All rights reserved.
//

import Foundation

class UseCase{
    func request(subreddit: Subreddit, sorting: Sorting, parameters: [Parameters:String], completion: @escaping ([RedditPost])->()){
        Repository.shared.createRequest(subreddit: subreddit, sorting: sorting, parameters: parameters, completion: { (result) in
            completion(Repository.shared.clearPosts(posts: result))
            
        })
    }
}
