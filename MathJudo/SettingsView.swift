//
//  SettingsView.swift
//  MathJudo
//
//  Created by Amber Spadafora on 10/15/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var isPresenting = false
    
    
    @ObservedObject var gameEngine: GameEngine = GameEngine(multiplier: 5, level: .easy)
    
    var body: some View {
        let playButton = Button("Play Game") {
            self.gameEngine.questions = GameEngine.generateQuestions(multiplier: self.gameEngine.multiplier, level: self.gameEngine.level)
            self.isPresenting = true
        }
        
        return VStack {
            ScrollView(.vertical, showsIndicators: true, content: {
                ForEach(1..<12) { number in
                    Button(action: {
                        self.gameEngine.multiplier = number
                    }) {
                        VStack {
                            Text("\(number)")
                                .font(.largeTitle)
                                .bold()
                                .frame(width: 240, height: 120)
                                .foregroundColor(.white)
                                .background(Color.green)
                                .clipShape(RoundedRectangle(cornerRadius: 20, style: .circular))
                            Text("").frame(width: 240, height: 20)
                        }
                        
                    }
                }
            }).frame(width: 250, height: 350)
            
            
            Picker("Choose a level", selection: self.$gameEngine.level) {
                Text("Easy").tag(Level.easy)
                Text("Medium").tag(Level.medium)
                Text("Hard").tag(Level.hard)
            }.labelsHidden()
            
            playButton
            if isPresenting {
                ZStack {
                    ForEach(0..<gameEngine.questions.count, id: \.self) { index in
                        ProblemCardView(question: self.gameEngine.questions[index]) {
                            self.gameEngine.questions.remove(at: index)
                            if self.gameEngine.questions.count == 0 { self.isPresenting.toggle() }
                        }
                    }
                }
            }
        }
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(gameEngine: GameEngine(multiplier: 5, level: .easy))
    }
}
