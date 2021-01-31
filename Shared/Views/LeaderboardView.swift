//
//  LeaderboardView.swift
//  game
//
//  Created by Hieu C Trac on 1/17/21.
//

import SwiftUI

struct LeaderboardView: View {
    
    @Binding var isLeaderboardVisible: Bool
    @Binding var game: Game
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 10) {
                HeaderView(isLeaderboardVisible: $isLeaderboardVisible)
                LabelView()
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(game.leaderboardEnties.indices) { index in
                            let entry = game.leaderboardEnties[index]
                            RowView(index: index, score: entry.score, date: entry.date)
                        }
                    }
                }
            }
        }
    }
}

struct RowView: View {
    
    let index: Int
    let score: Int
    let date: Date
    
    var body: some View {
        HStack {
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(score: score)
                .frame(width: Constants.Leaderboard.scoreColWidth)
            Spacer()
            DateText(date: date)
                .frame(width: Constants.Leaderboard.dateColWidth)
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
        )
        .padding(.horizontal)
        .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
    }
}

struct HeaderView: View {
    
    @Binding var isLeaderboardVisible: Bool
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        ZStack {
            HStack {
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    BigBoldText(text: "Leaderboard")
                        .padding(.leading)
                    Spacer()
                } else {
                    BigBoldText(text: "Leaderboard")

                }
            }
            HStack {
                Spacer()
                Button(action: {
                    isLeaderboardVisible = false
                }, label: {
                    RoundedImageViewFilled(systemName: "xmark")
                        .padding(.trailing)
                })
            }
        }
        .padding(.top)
    }
}

struct LabelView: View {
    var body: some View {
        HStack {
            Spacer()
                .frame(width: Constants.General.roundedViewLength)
            Spacer()
            LabelText(text: "Score")
                .frame(width: Constants.Leaderboard.scoreColWidth)
            Spacer()
            LabelText(text: "Date")
                .frame(width: Constants.Leaderboard.dateColWidth)
            
        }
        .padding(.horizontal)
        .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    
    static private let isLeaderboardVisible = Binding.constant(false)
    static private let game = Binding.constant(Game(loadTestData: true))
    
    static var previews: some View {
        LeaderboardView(isLeaderboardVisible: isLeaderboardVisible, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
        LeaderboardView(isLeaderboardVisible: isLeaderboardVisible, game: game)
        LeaderboardView(isLeaderboardVisible: isLeaderboardVisible, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(.dark)
        LeaderboardView(isLeaderboardVisible: isLeaderboardVisible, game: game)
            .preferredColorScheme(.dark)
    }
}
