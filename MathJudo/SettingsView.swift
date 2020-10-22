//
//  SettingsView.swift
//  MathJudo
//
//  Created by Amber Spadafora on 10/15/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

// <a href='https://www.freepik.com/vectors/frame'>
// Frame vector created by macrovector - www.freepik.com</a>


import SwiftUI

struct SettingsView: View {
    
    @State private var isPresenting = false
    @ObservedObject var gameEngine: GameEngine = GameEngine(multiplierIndex: 4, level: .easy)
    
    func resetGameEngine() {
        self.gameEngine.questions = GameEngine.generateQuestions(multiplier: self.gameEngine.multipliers[self.gameEngine.multiplierIndex], level: self.gameEngine.level).shuffled()
    }
    
    var body: some View {
        
        let playButton = Button(action:{
            self.resetGameEngine()
            self.isPresenting = true
        }) {
            Image("playbutton").renderingMode(.original)
        }
        
        return VStack {
            VStack {
                if !isPresenting {
                    ZStack {
                        Image("buttonBackground")
                        VStack {
                            Text("CHOOSE A TIMES TABLE TO PRACTICE")
                                .font(.custom("Carnetdevoyage", size: 18))
                                .foregroundColor(Color.black)
                                .multilineTextAlignment(.center)
                                .padding(.top, 75.0)
                                .frame(width: 230.0)
                            Picker("", selection: self.$gameEngine.multiplierIndex) {
                                ForEach(1..<13) { number in
                                    Text("\(number)").font(Font.custom("PEEPS", size: 18))
                                }
                            }.labelsHidden()
                        }
                    }.transition(.slide)
                    
                    Picker("", selection: self.$gameEngine.level) {
                        Text("Easy").tag(Level.easy)
                        Text("Medium").tag(Level.medium)
                        Text("Hard").tag(Level.hard)
                    }.pickerStyle(SegmentedPickerStyle())
                        .font(Font.custom("Carnetdevoyage", size: 18))
                        .foregroundColor(Color.black)
                        
                    playButton
                } else {
                    Text("Score: \(self.gameEngine.correctAnswers)").font(.title).foregroundColor(Color.black)
                    ZStack {
                        
                        ForEach(0..<gameEngine.questions.count, id: \.self) { index in
                            ProblemCardView(question: self.gameEngine.questions[index]) { problemSolved in
                                self.gameEngine.questions.remove(at: index)
                                if problemSolved { self.gameEngine.correctAnswers += 1 }
                                if self.gameEngine.questions.count == 0 { self.isPresenting.toggle() }
                            }.transition(.move(edge: .leading))
                            
                        }
                    }.transition(.slide)
                    
                    Button(action: {
                        self.isPresenting = false
                    }) {
                        Image("stopButton").renderingMode(.original)
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
