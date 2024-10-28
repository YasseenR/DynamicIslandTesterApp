//
//  ScoreboardBundle.swift
//  Scoreboard
//
//  Created by Yasseen Rouni on 10/28/24.
//

import WidgetKit
import SwiftUI

@main
struct ScoreboardBundle: WidgetBundle {
    var body: some Widget {
        Scoreboard()
        ScoreboardLiveActivity()
    }
}
