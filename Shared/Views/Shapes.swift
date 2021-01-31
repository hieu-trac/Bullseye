//
//  Shapes.swift
//  game
//
//  Created by Hieu C Trac on 1/15/21.
//

import SwiftUI

struct Shapes: View {
    
    @State private var showWideShapes = true
    
    var body: some View {
        VStack {
            
            if !showWideShapes {
                Circle()
                    .strokeBorder(Color.blue, lineWidth: 20.0)
                    .frame(width: 200.0, height: 100.0)
                    .transition(.scale)
            }
            RoundedRectangle(cornerRadius: 20.0)
                .fill(Color.blue)
                .frame(width: showWideShapes ? 200.0 : 100.0, height: 100.0)
            Capsule()
                .fill(Color.blue)
                .frame(width: showWideShapes ? 200.0 : 100.0, height: 100.0)
            Ellipse()
                .fill(Color.blue)
                .frame(width: showWideShapes ? 200.0 : 100.0, height: 100.0)
            Button(action: {
                withAnimation {
                    showWideShapes.toggle()
                }
            }, label: {
                Text("Animate")
            })
        }
        .background(Color.green)
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
