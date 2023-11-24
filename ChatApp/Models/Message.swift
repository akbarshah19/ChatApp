//
//  Message.swift
//  ChatApp
//
//  Created by Akbarshah Jumanazarov on 11/24/23.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
    var timeStamp: Date
}
