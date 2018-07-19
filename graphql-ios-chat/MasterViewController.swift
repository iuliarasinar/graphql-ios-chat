//
//  MasterViewController.swift
//  graphql-ios-chat
//
//  Created by Iulia Rasinar on 12.07.18.
//  Copyright © 2018 Iulia Rasinar. All rights reserved.
//

import UIKit
import Apollo

class MasterViewController: UITableViewController {

    var users: [UsersQueryQuery.Data.User?]? {
        didSet {
            tableView.reloadData()
        }
    }

    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UserCell")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadUsers()
    }
    
    // MARK: - Data loading
    
    var watcher: GraphQLQueryWatcher<UsersQueryQuery>?

    func loadUsers() {
        watcher = apollo.watch(query: UsersQueryQuery()) { (result, error) in
            if let error = error {
                NSLog("Error while fetching query: \(error.localizedDescription)")
                return
            }
            
            self.users = result?.data?.users
        }
    }

    // MARK: - Table View

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath as IndexPath)
        cell.textLabel!.text = users?[indexPath.row]?.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let object = users?[indexPath.row]?.id
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "details") as! ChatViewController
            controller.setUser(userId: object)
            self.navigationController?.pushViewController(controller, animated: false)
        }
    }

}

