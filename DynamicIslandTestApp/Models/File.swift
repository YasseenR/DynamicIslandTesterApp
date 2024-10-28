//
//  File.swift
//  DynamicIslandTestApp
//
//  Created by Yasseen Rouni on 10/28/24.
//

import ActivityKit
import SwiftUI

struct Team: Codable, Hashable {
    var name: String
    var image: String
    var score: Int
}

struct Match: Codable, Hashable {
    var homeTeam: Team
    var awayTeam: Team
    var leagueName: String
}


struct MatchAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var match: Match
    }
    
    var title: String
}
