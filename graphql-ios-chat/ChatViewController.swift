//
//  ChatViewController.swift
//  graphql-ios-chat
//
//  Created by Iulia Rasinar on 12.07.18.
//  Copyright © 2018 Iulia Rasinar. All rights reserved.
//

import UIKit
import Apollo

class ChatViewController: UITableViewController {

    var userId: String?
    var subFromTo: Cancellable?
    var subToFrom: Cancellable?
    
    var messages = [String]()
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MessageCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeNewMessage(from: userId!, to: currentUser)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        cancelSubscription()
    }

    // MARK: - Table View
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath as IndexPath)
        cell.textLabel!.text = messages[indexPath.row]
        return cell
    }
    
    func setUser(userId: String?) {
        self.userId = userId
    }
    
    // MARK: - Subscription, Mutation
    
    private func sendMessage(text: String) {
        apollo.perform(mutation: AddMessageMutationMutation(from: currentUser, to: userId!, text: text)) { (result, error) in
            if let error = error {
                NSLog("Error while attempting to send message: \(error.localizedDescription)")
            }
        }
    }
    
    private func subscribeNewMessage(from: String, to: String) {
        subFromTo = apollo.subscribe(subscription: NewMessageSubscriptionSubscription(userId1: from, userId2: to)) { (result, error) in
            
            if let error = error {
                NSLog("Error while attempting to send message: \(error.localizedDescription)")
                return
            }
            
            self.messages.append(result?.data?.newMessage?.text ?? "")
            self.tableView.reloadData()
        }
        
        subToFrom = apollo.subscribe(subscription: NewMessageSubscriptionSubscription(userId1: to, userId2: from)) { (result, error) in
            
            if let error = error {
                NSLog("Error while attempting to send message: \(error.localizedDescription)")
                return
            }
            
            self.messages.append(result?.data?.newMessage?.text ?? "")
            self.tableView.reloadData()
        }
        
    }
    
    private func cancelSubscription() {
        subToFrom?.cancel()
        subFromTo?.cancel()
    }
}
