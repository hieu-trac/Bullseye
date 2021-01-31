//
//  BackgroundView.swift
//  game
//
//  Created by Hieu C Trac on 1/15/21.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game
    
    var body: some View {
        ZStack {
            VStack {
                TopView(game: $game)
                Spacer()
                BottomView(game: $game)
            }
            .padding()
            .background(
                RingsView()
        )
        }
    }
}

struct TopView: View {
    @Binding var game: Game
    @State private var isLeaderboardVisible = false
    
    var body: some View {
        HStack {
            Button(action: {
                game.restart()
            }) {
                RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            }
            Spacer()
            Button(action: {
                isLeaderboardVisible = true
            }, label: {
                RoundedImageViewFilled(systemName: "list.bullet")
            }).sheet(isPresented: $isLeaderboardVisible, onDismiss: {
                //isLeaderboardVisible = false
            }, content: {
                LeaderboardView(isLeaderboardVisible: $isLeaderboardVisible, game: $game)
            })
        }
    }
}

struct BottomView: View {
    @Binding var game: Game
    
    var body: some View {
        HStack {
            NumberView(title: "score", text: String(game.score))
            Spacer()
            NumberView(title: "round", text: String(game.round))
        }
    }
}

struct NumberView: View {
    var title: String
    var text: String
    
    var body: some View {
        VStack(spacing: 5) {
            LabelText(text: title)
            RoundRectTextView(text: text)
        }
    }
}

struct RingsView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            ForEach(1..<6) { ring in
                let size = CGFloat(ring * 100)
                let opacity = colorScheme == .dark ? 0.1 : 0.3
                Circle()
                    .stroke(lineWidth: Constants.General.strokeWidth)
                    .fill(RadialGradient(gradient: Gradient(colors: [Color("RingColor").opacity(0.8 * opacity), Color("RingColor").opacity(0.0)]), center: .center, startRadius: 100, endRadius: 300))
                    .frame(width: size, height: size)
            }
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
        BackgroundView(game: .constant(Game()))
            .preferredColorScheme(.dark)
    }
}
