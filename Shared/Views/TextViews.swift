//
//  TextViews.swift
//  game
//
//  Created by Hieu C Trac on 1/14/21.
//

import SwiftUI

struct InstructionsText: View {
    
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .foregroundColor(Color("TextColor"))
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
    }
}

struct BigNumberText: View {
    var text: String
    
    var body: some View {
        Text(String(text))
            .foregroundColor(Color("TextColor"))
            .fontWeight(.black)
            .kerning(-1.0)
            .lineSpacing(2.0)
            .font(.largeTitle)
    }
}

struct SliderLabelText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(Color("TextColor"))
            .bold()
            .frame(width: 38.0)
    }
    
}

struct LabelText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .font(.caption)
            .foregroundColor(Color("TextColor"))
            .bold()
            .kerning(1.5)
    }
}

struct BodyText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(12.0)
    }
}

struct ButtonText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.headline)
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .background(Color.accentColor)
            .cornerRadius(12.0)
    }
}

struct ScoreText: View {
    var score: Int
    
    var body: some View {
        Text(String(score))
            .font(.title3)
            .bold()
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
    }
}

struct DateText: View {
    var date: Date
    
    var body: some View {
        Text(date, style: .time)
            .font(.title3)
            .bold()
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigBoldText: View {
    let text: String
    
    var body: some View {
        Text(text.uppercased())
            .fontWeight(.black)
            .kerning(2.0)
            .font(.title)
            .foregroundColor(Color("TextColor"))
    }
}

struct Preview: View {
    
    var body: some View {
        VStack {
            InstructionsText(text: "Instructions")
            BigNumberText(text: "100")
            SliderLabelText(text: "999")
            LabelText(text: "score")
            BodyText(text: "You scored 200 Points\n🎉🎉🎉")
            ButtonText(text: "Start New Round")
            ScoreText(score: 459)
            DateText(date: Date())
            BigBoldText(text: "Leaderboard")
        }
        .padding()
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
            .previewLayout(.fixed(width: 568, height: 320))
        Preview()
        Preview()
            .previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(.dark)
        Preview()
            .preferredColorScheme(.dark)
    }
}
