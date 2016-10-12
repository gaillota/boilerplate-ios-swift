//
//  IntExtension.swift
//  boilerplate-ios-swift
//
//  Created by agaillot on 12/10/2016.
//  Copyright © 2016 agaillot. All rights reserved.
//

import DateHelper

extension Int {
    func formatDate() -> String {
        let date = NSDate(timeIntervalSince1970: self)
        return date.isToday() ? date.toString(format: .Custom("HH:mm")) : date.isThisYear() ? date.toString(format: .Custom("dd/MM")) : date.toString(format: .Custom("dd/MM/yyyy"))
    }
}