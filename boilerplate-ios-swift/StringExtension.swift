//
//  StringExtension.swift
//  boilerplate-ios-swift
//
//  Created by agaillot on 12/10/2016.
//  Copyright © 2016 agaillot. All rights reserved.
//

import Foundation

extension String {
    func trim() -> String {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }
    
    func replace(target: String, with: String) -> String {
        return self.stringByReplacingOccurrencesOfString(target, withString: with)
    }
}