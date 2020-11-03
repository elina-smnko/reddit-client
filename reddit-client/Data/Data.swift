//
//  Data.swift
//  reddit-client
//
//  Created by Элина on 03.11.2020.
//  Copyright © 2020 Элина. All rights reserved.
//

import Foundation

struct Nest: Codable {
    let data: Datas
    
    struct Datas: Codable{
        let children: [InnerData]
        
        struct InnerData: Codable {
            let data: RedditPostRem
            
            struct RedditPostRem: Codable, Comparable {
                
                let username: String
                let domain: String
                let time: Double
                let title: String
                let rating: Int
                let num_comments: Int
                let image: String
                
                static func < (lhs: Nest.Datas.InnerData.RedditPostRem, rhs: Nest.Datas.InnerData.RedditPostRem) -> Bool {
                    return lhs.username < rhs.username && lhs.domain < rhs.domain && lhs.time < rhs.time && lhs.title < rhs.title && lhs.rating < rhs.rating && lhs.num_comments < rhs.num_comments && lhs.image < rhs.image
                }
            
                enum CodingKeys: String, CodingKey{
                    case domain, title, num_comments
                    case rating = "ups"
                    case username = "author"
                    case time = "created"
                    case image = "url"
                }
            }
        }
    }
}

class RedditPost{
    let username: String
    let domain: String
    let time: Date
    let title: String
    let rating: Int
    let num_comments: Int
    let imageLink: String
    var saved: Bool
    
    init(username: String, domain: String, time: Date, title: String, rating: Int, num_comments: Int, imageLink: String) {
        self.username = username
        self.domain = domain
        self.time = time
        self.title = title
        self.rating = rating
        self.num_comments = num_comments
        self.imageLink = imageLink
        self.saved = false
    }
    
    init() {
        self.username = "username"
        self.domain = "domain"
        self.time = Date()
        self.title = "title"
        self.rating = 0
        self.num_comments = 0
        self.imageLink = "imageLink"
        self.saved = false
    }
    
    
}
































