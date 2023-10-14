//
//  ContentView.swift
//  Animations Project
//
//  Created by Shubham on 10/14/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: Properties
    @State private var animationAmount = 1.0
    
    
    // MARK: Body
    var body: some View {
        VStack() {
            Button("Single") {
                // do nothing
//                animationAmount += 1
            }
            .padding(50)
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Circle())
            .overlay {
                Circle()
                    .stroke(.blue)
                    .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount)
                    .animation(
                        .easeInOut(duration: 1)
                        .repeatForever(autoreverses: false)
                        , value: animationAmount)
            }
            .onAppear {
                animationAmount = 2
            }
        }
        
    }
}

#Preview {
    ContentView()
}
