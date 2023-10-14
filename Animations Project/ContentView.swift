//
//  ContentView.swift
//  Animations Project
//
//  Created by Shubham on 10/14/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: Properties
    @State private var isShowingRec = false
    
    // MARK: Body
    var body: some View {
        VStack {
            Button("Tap me") {
                withAnimation {
                    isShowingRec.toggle()
                }
            }
            
            if isShowingRec {
                Rectangle()
                    .fill(.orange)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
}

#Preview {
    ContentView()
}










struct SnakeLetterEffect: View {
    let letters = Array("Hello Swift")
    @State private var dragAmount = CGSize.zero
    @State private var enabled = false

    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<letters.count, id: \.self) { num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? .blue : .red)
                    .offset(dragAmount)
                    .animation(
                        .default.delay(Double(num) / 15)
                        , value: dragAmount
                    )
            }
        }
        .gesture(
            DragGesture()
                .onChanged { dragAmount = $0.translation}
                .onEnded { _ in
                    dragAmount = .zero
                    enabled.toggle()
                }
        )

    }
}

struct PulsatingButton: View {
    @State private var animationAmount = 1.0
    
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

struct RotationEffectButton: View {
    @State private var animationAmount = 0.0
    
    var body: some View {
        // MARK: Body
        VStack {
            Button("Tap Me") {
                withAnimation {
                    animationAmount += 180
                }
            }
            .padding(50)
            .frame(width: 300, height: 200)
            .background(Color.indigo)
            .foregroundStyle(.white)
            .border(Color.black, width: 4.0)
            .clipShape(RoundedRectangle(cornerRadius: 8.0))
            .shadow(radius: 6.0)
            .rotation3DEffect(.degrees(animationAmount),axis: (x: 1.0, y: 0.0, z: 0.0))
        }
        
    }
}
