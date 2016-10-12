//
//  PostFactory.swift
//  boilerplate-ios-swift
//
//  Created by agaillot on 12/10/2016.
//  Copyright © 2016 agaillot. All rights reserved.
//

import Foundation
import SwiftyJSON

class PostFactory {
    static let instance = PostFactory()
    
    func createPostsFromArray(array postsArray: [JSON]) -> [Post] {
        var posts = [Post]
        
        for postJson in postsArray {
            if let post = self.createPostFromJson(postJson) {
                posts.append(post)
            }
        }
        
        return posts
    }
    
    func createPostFromJson(postJson: JSON) -> Post {
        var post = Post()
        
        post.id = postJson[Constants.Post.idLabel].string
        post.name = postJson[Constants.Post.nameLabel].string
        post.text = postJson[Constants.Post.textLabel].string
        post.createdAt = postJson[Constants.Post.createdAtLabel]
        post.userId = postJson[Constants.Post.userIdLabel]
        
        return post.isValid() ? post : nil
    }
}