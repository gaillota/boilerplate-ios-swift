//
//  UIViewControllerExtension.swift
//  boilerplate-ios-swift
//
//  Created by agaillot on 12/10/2016.
//  Copyright © 2016 agaillot. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func alert(message: String, title: String = "An error occured") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Close", style: .Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
}