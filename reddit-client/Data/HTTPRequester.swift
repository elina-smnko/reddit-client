//
//  HTTPRequester.swift
//  reddit-client
//
//  Created by Элина on 03.11.2020.
//  Copyright © 2020 Элина. All rights reserved.
//

import Foundation

class HTTPRequester{
   
    private func formURL(subreddit: Subreddit, sorting: Sorting, parameters: [Parameters:String]) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = Components.scheme.url
        urlComponents.host = Components.host.url
        urlComponents.path = Components.path.url+subreddit.url+sorting.url
        urlComponents.queryItems = [URLQueryItem]()
        for (param, value) in parameters {
            urlComponents.queryItems?.append(URLQueryItem(name: param.url, value: value))
        }
    return urlComponents.url
    }
    
    
    func performRequest(subreddit: Subreddit, sorting: Sorting, parameters: [Parameters:String], completion: @escaping ([Nest.Datas.InnerData])->()){
        
        guard let url = formURL(subreddit: subreddit, sorting: sorting, parameters: parameters) else {
            print("invalid url")
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data,response,error) in
            if let error = error {
                    print(error.localizedDescription)
                    return
                   }
            if let data = data {
                do{
                let result = try JSONDecoder().decode(Nest.self, from: data)
                    completion(result.data.children)
                    
                } catch{
                    print("error decoding")
                }
            }
        }
        task.resume()
        return
    }
}

enum Parameters {
    case after, before, limit, count, show
    var url: String {
        switch self {
        case .after:
            return "after"
        case .before:
            return "before"
        case .limit:
            return "limit"
        case .count:
            return "count"
        case .show:
            return "show"
        }
    }
}

enum Sorting {
    case hot, new, rising, top, controversial
    var url: String {
        switch self {
        case .hot:
            return "/hot.json"
        case .new:
            return "/new.json"
        case .rising:
            return "/rising.json"
        case .top:
            return "/top.json"
        case .controversial:
            return "/controversial.json"
        }
    }
}

enum Subreddit {
    case ios, android, explainlikeimfive, wholesomememes, FoodPorn
    var url: String {
        switch self {
        case .ios:
            return "/ios"
        case .android:
            return "/android"
        case .explainlikeimfive:
            return "/explainlikeimfive"
        case .wholesomememes:
            return "/wholesomememes"
        case .FoodPorn:
            return "/FoodPorn"
        }
    }
}

enum Components{
    case scheme, host, path
    var url: String {
        switch self {
        case .scheme:
            return "https"
        case .host:
            return "www.reddit.com"
        case .path:
            return "/r"
        }
    }
}

