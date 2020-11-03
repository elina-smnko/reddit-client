//
//  PersistentManager.swift
//  reddit-client
//
//  Created by Элина on 03.11.2020.
//  Copyright © 2020 Элина. All rights reserved.
//

import Foundation

class PersistenceManager{
    
    static var shared: PersistenceManager = {
           let instance = PersistenceManager()
           return instance
       }()
    
    
     var database = [Nest.Datas.InnerData.RedditPostRem]()
    
    private func save(post: Nest.Datas.InnerData.RedditPostRem){
        database.append(post)
    }
    
    func savePosts(posts: [Nest.Datas.InnerData.RedditPostRem]) -> [Nest.Datas.InnerData.RedditPostRem] {
        for post in posts{
            save(post: post)
        }
        return posts
    }
    
    func remove(post: Nest.Datas.InnerData.RedditPostRem, completion: (Bool) -> ()){
        for post in database{
            if post == post {
                database.remove(at: database.firstIndex(of: post)!)
                completion(true)
                return
            }
        }
        completion(false)
    }
    
    func getLastPost(completion: (Bool) -> ()) -> Nest.Datas.InnerData.RedditPostRem?{
        guard let post = database.last else {
            completion(false)
            return nil
        }
        completion(true)
        return post
    }
    
    func getLastPosts(amount: Int, completion: (Bool) -> ()) -> [Nest.Datas.InnerData.RedditPostRem]?{
        if database.count >= amount{
            return database.suffix(amount)
        } else {return nil}
    }
    
    func getAllPosts() -> [Nest.Datas.InnerData.RedditPostRem]{
        return database
    }
    
}
