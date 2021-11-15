//
//  Message.swift
//  TelegramRedesign
//
//  Created by Raphael Cerqueira on 14/11/21.
//

import Foundation
import SwiftUI

struct Message: Identifiable {
    let id = UUID().uuidString
    let fromImage: String
    let groupName: String?
    let fromName: String
    let lastMessage: String
    let seen: Bool
    let time: String
    let count: Int
    
    init(fromImage: String, groupName: String? = nil, fromName: String, lastMessage: String, seen: Bool, time: String, count: Int = 0) {
        self.fromImage = fromImage
        self.groupName = groupName
        self.fromName = fromName
        self.lastMessage = lastMessage
        self.seen = seen
        self.time = time
        self.count = count
    }
}

let messages = [
    Message(fromImage: "person1", fromName: "Justin Felix", lastMessage: "Hey! Are you freen to work later?", seen: false, time: "6:49 PM", count: 2),
    Message(fromImage: "group1", groupName: "Campus Public Chat", fromName: "Jessica Stevenson", lastMessage: "Reminder: School sponsored...", seen: true, time: "6:49 PM"),
    Message(fromImage: "person2", fromName: "Nico Huggins", lastMessage: "Did you see this? 🤣", seen: false, time: "12:27 PM", count: 1),
    Message(fromImage: "person3", fromName: "Max", lastMessage: "OMG! I actually love that.", seen: true, time: "7:02 AM"),
    Message(fromImage: "person4", fromName: "Katherine", lastMessage: "Tell her tonight. And let me know.", seen: true, time: "3:44 AM"),
    Message(fromImage: "person5", fromName: "Jenny Smith", lastMessage: "Sent an image", seen: false, time: "12:30 AM")
]
