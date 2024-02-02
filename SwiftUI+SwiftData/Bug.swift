//
//  Bug.swift
//  SwiftUI+SwiftData
//
//  Created by Moataz Akram on 31/01/2024.
//

import Foundation
import SwiftData

@Model
class Bug {
    var team: String
    var number: Int
    var assignee: String
    
    init(team: String, number: Int, assignee: String) {
        self.team = team
        self.number = number
        self.assignee = assignee
    }
}
