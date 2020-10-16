//
//  SettingsView.swift
//  MathJudo
//
//  Created by Amber Spadafora on 10/15/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var multiplier = 5
    @State private var level: Level = .easy
    var questions: Questions {
        return Questions(multiplier: multiplier, level: self.level)
    }
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: true, content: {
                ForEach(1..<12) { number in
                    Button(action: {
                        self.multiplier = number
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
            
            
//            Stepper(value: $multiplier, in: 1...12, step: 1) {
//                Text("Pick a times table to practice: \(questions.multiplier)").padding()
//            }
            
            Picker("Choose a level", selection: $level) {
                Text("Easy").tag(Level.easy)
                Text("Medium").tag(Level.medium)
                Text("Hard").tag(Level.hard)
            }.labelsHidden()
            
        }
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
