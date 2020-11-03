//
//  PostViewModel.swift
//  reddit-client
//
//  Created by Элина on 03.11.2020.
//  Copyright © 2020 Элина. All rights reserved.
//

import Foundation

class PostViewModel {
    
    func perform(subreddit: Subreddit, sorting: Sorting, parameters: [Parameters:String]){
        UseCase().request(subreddit: subreddit, sorting: sorting, parameters: parameters, completion: {(res) in
        
        })
    }
}
