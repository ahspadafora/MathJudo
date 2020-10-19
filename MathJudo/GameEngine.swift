//
//  GameEngine.swift
//  MathJudo
//
//  Created by Amber Spadafora on 10/17/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import SwiftUI

struct Question: Hashable, Comparable {
    static func < (lhs: Question, rhs: Question) -> Bool {
        return lhs.multiplicand < rhs.multiplicand
    }
    
    var id: Int
    var multiplier: Int
    var multiplicand: Int
    var product: Int
    
    static func == (lhs: Question, rhs: Question) -> Bool {
        return (lhs.multiplier == rhs.multiplier && lhs.multiplicand == rhs.multiplicand && lhs.product == rhs.product)
    }

}

enum Level: Int, CaseIterable, Identifiable {
    case easy = 5
    case medium = 10
    case hard = 12
    
    var id: Int { return self.rawValue }
}

class GameEngine: ObservableObject {
    
    @Published var multiplier: Int
    @Published var level: Level
    @Published var questions: [Question] = []

    init(multiplier: Int, level: Level) {
        self.multiplier = multiplier
        self.level = level
        self.questions = GameEngine.generateQuestions(multiplier: multiplier, level: level)
    }
    
    static func generateQuestions(multiplier: Int, level: Level) -> [Question] {
        var questions: [Question] = []
        var index = 0
        // loops over number of Questions with i representing each question id
        for multiplicand in 1...level.rawValue {
            let q = Question(id: index, multiplier: multiplier, multiplicand: multiplicand, product: multiplier * multiplicand)
            questions.append(q)
            index += 1
        }
        return questions
    }

    
}
