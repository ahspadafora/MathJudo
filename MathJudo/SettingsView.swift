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
    @ObservedObject var gameEngine: GameEngine = GameEngine(multiplierIndex: 4, level: .easy)
    
    var body: some View {
        
        let playButton = Button(action:{
            self.gameEngine.questions = GameEngine.generateQuestions(multiplier: self.gameEngine.multipliers[self.gameEngine.multiplierIndex], level: self.gameEngine.level)
            self.isPresenting = true
        }) {
            Image("startButton").renderingMode(.original)
        }
        
        return VStack {
            
            VStack {
                if !isPresenting {
                    Text("CHOOSE A TIMES TABLE TO PRACTICE")
                        .font(.custom("Carnetdevoyage", size: 18))
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                        .frame(width: 250)
                    Picker("Choose a times table to practice", selection: self.$gameEngine.multiplierIndex) {
                        ForEach(1..<13) { number in
                            Text("\(number)").font(Font.custom("PEEPS", size: 28))
                        }
                    }.labelsHidden()
                    Picker("Choose a level", selection: self.$gameEngine.level) {
                        Text("Easy").tag(Level.easy)
                        Text("Medium").tag(Level.medium)
                        Text("Hard").tag(Level.hard)
                    }.pickerStyle(SegmentedPickerStyle()).font(.title)
                    playButton
                } else {
                    
                    ZStack {
                        ForEach(0..<gameEngine.questions.count, id: \.self) { index in
                            ProblemCardView(question: self.gameEngine.questions[index]) {
                                
                                self.gameEngine.questions.remove(at: index)
                                
                                if self.gameEngine.questions.count == 0 { self.isPresenting.toggle() }
                            }
                        }
                        
                    }
                    Button("Main Menu") {
                        self.isPresenting = false
                    }
                
                }
            }.animation(.default)
            
            
        }
        
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(gameEngine: GameEngine(multiplierIndex: 5, level: .easy))
    }
}
