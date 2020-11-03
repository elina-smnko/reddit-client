//
//  Repository.swift
//  reddit-client
//
//  Created by Элина on 03.11.2020.
//  Copyright © 2020 Элина. All rights reserved.
//

import Foundation

class Repository{
    static var shared: Repository = {
        let instance = Repository()
        return instance
    }()
    
    func createRequest(subreddit: Subreddit, sorting: Sorting, parameters: [Parameters:String], completion: @escaping ([Nest.Datas.InnerData.RedditPostRem]) -> ()) {
        HTTPService.shared.request(subreddit: subreddit, sorting: sorting, parameters: parameters) { (comp) in
            completion(comp)
        }
    }
    
    func clearPosts(posts: [Nest.Datas.InnerData.RedditPostRem]) -> [RedditPost]{
        var result = [RedditPost]()
        for post in posts {
            result.append(RedditPost(username: post.username, domain: post.domain, time: Date(timeIntervalSince1970: post.time), title: post.title, rating: post.rating, num_comments: post.num_comments, imageLink: post.image))
        }
        return result
    }
}
