//
//  PostsViewController.swift
//  boilerplate-ios-swift
//
//  Created by agaillot on 12/10/2016.
//  Copyright © 2016 agaillot. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class PostsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NVActivityIndicatorViewable {
    
    // MARK: - Outlets
    @IBOutlet weak var postsTableView: UITableView!
    
    // MARK: - Properties
    var posts = [Post]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Erase the blank cells
        self.postsTableView.tableFooterView = UIView()
        NVActivityIndicatorView.DEFAULT_TYPE = .Pacman
        
        self.loadData()
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Last \(self.posts.count) posts"
        }
        
        return nil
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let post = self.posts[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("PostCell", forIndexPath: indexPath) as! PostTableViewCell
        
        cell.nameLabel.text = post.name
        cell.textLabel.text = post.text
        cell.createdAtLabel.text = post.createdAt!.formatDate()
        
        return cell
    }
    
    func loadData() {
        self.startAnimating()
        
        PostRepository.instance.find() { (error, posts) in
            // Remove spinner no matter what
            self.stopAnimating()
            
            if error != nil {
                self.alert("Error while fecthing posts")
                return
            }
            
            self.posts = posts
            self.postsTableView.reloadData()
        }
    }
}
