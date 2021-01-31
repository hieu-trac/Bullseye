//
//  ContentView.swift
//  Shared
//
//  Created by Hieu C Trac on 1/13/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isAlertVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionsView(game: $game)
                    .padding(.bottom, isAlertVisible ? 0: 100)
                if isAlertVisible {
                    PointsView(isAlertVisible: $isAlertVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                } else {
                    HitMeButton(isAlertVisible: $isAlertVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                }
            }
            if !isAlertVisible {
                SliderView(sliderValue: $sliderValue)
                    .transition(.scale)
            }
        }
    }
}

struct InstructionsView: View {
    
    @Binding var game: Game
    
    var body: some View {
        VStack {
            InstructionsText(text: "🎯🎯🎯\nPut the Bullseye as close as you can to")
                .padding(.horizontal, 30.0)
            BigNumberText(text: String(game.target))
        }
    }
}

struct SliderView: View {
    
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            SliderLabelText(text: "0")
            BullseyeSlider(value: $sliderValue, bounds: 0...100)
            SliderLabelText(text: "100")
        }
        .padding()
    }
}

struct HitMeButton: View {
    
    @Binding var isAlertVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        Button(action: {
            withAnimation {
                isAlertVisible = true
            }
        }) {
            Text("Hit me".uppercased())
                .font(.title3)
                .bold()
        }
        .padding(20.0)
        .foregroundColor(Color.white)
        .background(ZStack {
            Color("ButtonColor")
            LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), .clear]), startPoint: .top, endPoint: .bottom)
        })
        .cornerRadius(Constants.General.roundRectCornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
        )
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
