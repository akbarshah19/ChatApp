//
//  MessengerManager.swift
//  ChatApp
//
//  Created by Akbarshah Jumanazarov on 11/24/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessagesManager: ObservableObject {
    @Published private(set) var messages: [Message] = []
    @Published private(set) var lastMsgID = ""
    let db = Firestore.firestore()
    
    init() {
        getMessages()
    }
    
    func getMessages() {
        db.collection("messages").addSnapshotListener { querySnapshot, error in
            guard let document = querySnapshot?.documents else {
                print("DEBUG ⚠️: Error fetching documents - \(String(describing: error))")
                return
            }
            
            self.messages = document.compactMap { document -> Message? in
                do {
                    return try document.data(as: Message.self)
                } catch {
                    print("DEBUG ⚠️: Error decoding document into Message - ", error)
                    return nil
                }
            }
            
            self.messages.sort {$0.timeStamp < $1.timeStamp}
            
            if let id = self.messages.last?.id {
                self.lastMsgID = id
            }
        }
    }
    
    func sendMessage(text: String) {
        do {
            let message = Message(id: "\(UUID())", text: text, received: false, timeStamp: Date())
            try db.collection("messages").document().setData(from: message)
        } catch {
            print("DEBUG ⚠️: Error adding message, \(error)")
        }
    }
}
