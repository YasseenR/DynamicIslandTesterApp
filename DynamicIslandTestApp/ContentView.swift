//
//  ContentView.swift
//  DynamicIslandTestApp
//
//  Created by Yasseen Rouni on 10/28/24.
//

import ActivityKit
import SwiftUI

struct ContentView: View {
    
    @State var homeTeam: Team = .init(name: "Home", image: "home", score: 0)
    @State var awayTeam: Team = .init(name: "Away", image: "barcelona", score: 0)
    var body: some View {
        VStack {
            HStack {

                teamView(for: $homeTeam)
                Spacer()
                Text("vs")
                Spacer()
                teamView(for: $awayTeam)

            }
            
            Button("Start Live Activity") {
                startLiveActivity()
            }
            
            Button("Stop Live Activity") {
                removeLiveActivity()
            }
        }
        .padding()
    }
    
    private func teamView(for team: Binding<Team>) -> some View {
        VStack {
            Text("\(team.wrappedValue.name)")
                .font(.title)
                .bold()
            
            Text("\(team.wrappedValue.score)")
                .font(.title2)
                .bold()
            
            Button {
                
            } label: {
                Label("Score", systemImage: "soccerball.inverse")
            }

        }
    }
    
    private func startLiveActivity() {
        let matchAttributes = MatchAttributes(title: "Game")
        
        let match: Match = .init(homeTeam: homeTeam, awayTeam: awayTeam, leagueName: "Game")
        
        let initialContentState = ActivityContent(state: MatchAttributes.ContentState(match: match), staleDate: nil)
        
        do {
            _ = try Activity<MatchAttributes>.request(attributes: matchAttributes, content: initialContentState)
        } catch {
            print(error.localizedDescription)
        }
        
        
    }
    
    private func removeLiveActivity() {
        if let activity = Activity<MatchAttributes>.activities.last {
            Task {
                await activity.end(activity.content, dismissalPolicy: .immediate)
            }
        }
    }
}

#Preview {
    ContentView()
}
