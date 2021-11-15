//
//  MenuItem.swift
//  TelegramRedesign
//
//  Created by Raphael Cerqueira on 14/11/21.
//

import Foundation
import SwiftUI

struct MenuItem: Identifiable {
    let id = UUID().uuidString
    let image: String
    let title: String
    let color: Color
}

let menuItems = [
    MenuItem(image: "person.fill", title: "Find People", color: Color("PrimaryColor")),
    MenuItem(image: "envelope.open.fill", title: "Invite Friends", color: Color("SecondaryColor")),
    MenuItem(image: "person.2.fill", title: "Join Group", color: Color("PrimaryColor"))
]
