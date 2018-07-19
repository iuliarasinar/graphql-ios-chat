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
    func setUser(userId: String?) {
        self.userId = userId
    }
    
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
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))
        
        let textField = UITextField(frame: CGRect(x: 10, y: 0, width: tableView.frame.size.width - 80, height: 50))
        textField.backgroundColor = UIColor.lightGray
        let sendButton = UIButton(frame: CGRect(x: tableView.frame.size.width - 60, y: 0, width: tableView.frame.size.width, height: 50))
        let sendButtonImage = UIImage(named: "send")
        sendButton.setImage(sendButtonImage , for: UIControlState.normal)
        
//        sendButton.addTarget(self, action:self.sendMessage(text:textField.text), for: .touchUpInside)
//        sendButton.setTitle("Send", for: .normal)
        sendButton.backgroundColor = UIColor.blue
        
        
        footerView.addSubview(textField)
        footerView.addSubview(sendButton)
        
        return footerView
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
    
    // MARK: - Subscription, Mutation
    
    func sendMessage(text: String?) {
        if (text == nil) {
            return
        }
        
        apollo.perform(mutation: AddMessageMutationMutation(from: currentUser, to: userId!, text: text!)) { (result, error) in
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
