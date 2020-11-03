//
//  HTTPService.swift
//  reddit-client
//
//  Created by Элина on 03.11.2020.
//  Copyright © 2020 Элина. All rights reserved.
//

import Foundation

class HTTPService{
    static var shared: HTTPService = {
        let instance = HTTPService()
        return instance
    }()
    
    func performRequest(subreddit: Subreddit, sorting: Sorting, parameters: [Parameters:String], completion: @escaping ([Nest.Datas.InnerData])->()){
        HTTPRequester().performRequest(subreddit: subreddit, sorting: sorting, parameters: parameters, completion: {result in
            completion(result)
        })
    }
    
    private func saveToDB(data: [Nest.Datas.InnerData]?, completion: ([Nest.Datas.InnerData.RedditPostRem]?)->()){
        guard let data = data else {
            return
        }
        var posts = [Nest.Datas.InnerData.RedditPostRem]()
        for post in data{
            posts.append(post.data)
        }
        let saved = PersistenceManager.shared.savePosts(posts: posts)
        completion(saved)
    }

    func request(subreddit: Subreddit, sorting: Sorting, parameters: [Parameters:String], completion: @escaping ([Nest.Datas.InnerData.RedditPostRem])->()){
        HTTPService.shared.performRequest(subreddit: subreddit, sorting: sorting, parameters: parameters) { (data) in
            HTTPService.shared.saveToDB(data: data) { (result) in
                completion(result!)
            }
        }
    }
    
}
