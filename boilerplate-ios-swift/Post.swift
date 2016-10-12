//
//  Post.swift
//  boilerplate-ios-swift
//
//  Created by agaillot on 12/10/2016.
//  Copyright © 2016 agaillot. All rights reserved.
//

import Foundation

struct Post {
    var id: String?
    var name: String?
    var text: String?
    var createdAt: Int? // Date in timestamp
    var userId: String?
    
    /* Ensure object consistency */
    func isValid() -> Bool {
        return  self.id != nil && self.name != nil && self.text != nil && self.createdAt != nil && self.userId != nil
    }
}