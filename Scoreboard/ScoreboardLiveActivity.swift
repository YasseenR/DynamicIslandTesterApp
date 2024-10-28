//
//  ScoreboardLiveActivity.swift
//  Scoreboard
//
//  Created by Yasseen Rouni on 10/28/24.
//

import ActivityKit
import WidgetKit
import SwiftUI


struct ScoreboardLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: MatchAttributes.self) { context in
            scoreboard(for: context)
                .activityBackgroundTint(.white)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    HStack {
                        Spacer()
                        Text(context.state.match.homeTeam.name)
                    }
                }
                DynamicIslandExpandedRegion(.trailing) {
                    HStack{
                        Text(context.state.match.awayTeam.name)
                        Spacer()
                    }
                }
                DynamicIslandExpandedRegion(.bottom) {
                    HStack {
                        Spacer()
                        VStack {
                            Text("\(context.state.match.homeTeam.score)")
                        }
                        .frame(width: 100, height: 50)
                        .background(Color.blue)
                        .clipShape(.capsule)
                        Spacer()
                        VStack {
                            Text("\(context.state.match.awayTeam.score)")
                        }
                        .frame(width: 100, height: 50)
                        .background(Color.red)
                        .clipShape(.capsule)
                        Spacer()
                    }
                }
            } compactLeading: {
                ZStack {
                    Color.blue
                    HStack {
                        Spacer()
                        Text("\(context.state.match.homeTeam.score)")
                        Spacer()
                    }
                }
                .frame(width:25)
                .clipShape(.capsule)

                
            } compactTrailing: {
                ZStack {
                    Color.red
                    HStack {
                        Spacer()
                        Text("\(context.state.match.awayTeam.score)")
                        Spacer()
                    }
                }
                .frame(width:25)
                .clipShape(.capsule)
            } minimal: {
                
            }

        }

    }
    
    
    private func scoreboard(for context: ActivityViewContext<MatchAttributes>) -> some View {
        VStack {
            HStack {
                teamView(for: context.state.match.homeTeam)
                    .background(Color.blue)
                    .ignoresSafeArea()
                
                
                teamView(for: context.state.match.awayTeam)
                    .ignoresSafeArea()
                    .background(Color.red)
                    
            }
        }
    }
    
    private func teamView(for team: Team) -> some View {
        VStack {
            Text(team.name)
                .font(.title3)
                .bold()
            Text("\(team.score)")
        }
        .frame(width: 200)
    }
}

