//
//  PostRepository.swift
//  boilerplate-ios-swift
//
//  Created by agaillot on 12/10/2016.
//  Copyright © 2016 agaillot. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class PostRepository {
    static let instance = PostRepository()
    
    func find(id: String, callback: (error: NSError?, post: Post?) -> Void) {
        let url = Constants.API.baseUrl + Constants.API.postsUri + "/" + id
        
        Alamofire.request(.GET, url).validate().responseJSON { response in
            switch response.result {
            case .Success(let value):
                let json = JSON(value)
                
                if let postJson = json["post"].json, let post = PostFactory.instance.createPostFromJson(postJson) {
                    callback(error: nil, post: post)
                } else {
                    callback(error: NSError(domain: "Post not found", code: 404), post: nil)
                }
            case .Failure(let error):
                callback(error: error, post: post)
            }
        }
    }
    
    func find(callback: (error: NSError?, posts: [Post]) -> Void) {
        let url = Constants.API.baseUrl + Constants.API.postsUri
        var posts = [Post]()
        
        Alamofire.request(.GET, url).validate().responseJSON { response in
            switch response.result {
            case .Success(let value):
                let json = JSON(value)
                
                if let postsJson = json["posts"].array {
                    posts = PostFactory.instance.createPostsFromArray(array: postsJson)
                }
                
                callback(error: nil, posts: posts)
            case .Failure(let error):
                callback(error: error, posts: posts)
            }
        }
    }
}