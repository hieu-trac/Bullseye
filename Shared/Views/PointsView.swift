//
//  PointsView.swift
//  game
//
//  Created by Hieu C Trac on 1/16/21.
//

import SwiftUI

struct PointsView: View {
    
    @Binding var isAlertVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        
        let roundedPoints = Int(sliderValue.rounded())
        let points = game.points(value: roundedPoints)
        
        VStack(spacing: 10) {
            InstructionsText(text: "The sliders value is")
            BigNumberText(text: String(roundedPoints))
            BodyText(text: "You scored \(points) Points\n🎉🎉🎉")
            Button(action: {
                withAnimation {
                    isAlertVisible = false
                }
                game.startNewRound(points: points)
            }, label: {
                ButtonText(text: "Start New Round")
            })
        }
            .padding()
            .frame(maxWidth: 300.0)
            .background(Color("BackgroundColor"))
            .cornerRadius(Constants.General.roundRectCornerRadius)
            .shadow(radius: 10, x: 5, y: 5)
        .transition(.scale)
    }
}

struct PointsView_Previews: PreviewProvider {
    
    static private let isAlertVisible = Binding.constant(false)
    static private let sliderValue = Binding.constant(50.0)
    static private let game = Binding.constant(Game())
    
    static var previews: some View {
        PointsView(isAlertVisible: isAlertVisible, sliderValue: sliderValue, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
        PointsView(isAlertVisible: isAlertVisible, sliderValue: sliderValue, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
            .colorScheme(.dark)
        PointsView(isAlertVisible: isAlertVisible, sliderValue: sliderValue, game: game)
        PointsView(isAlertVisible: isAlertVisible, sliderValue: sliderValue, game: game)
            .colorScheme(.dark)
    }
}
