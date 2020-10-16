//
//  Questions.swift
//  MathJudo
//
//  Created by Amber Spadafora on 10/15/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import Foundation


struct Question: Hashable {
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

struct Questions {
    
    var multiplier: Int
    var level: Level
    var questions: Set<Question> = []
    
    init(multiplier: Int, level: Level) {
        self.multiplier = multiplier
        self.level = level
        self.questions = Questions.generateQuestions(multiplier: multiplier, level: level)
    }
    
    static func generateQuestions(multiplier: Int, level: Level) -> Set<Question> {
        var questions: Set<Question> = []
        var index = 0
        // loops over number of Questions with i representing each question id
        for multiplicand in 1...level.rawValue {
            let q = Question(id: index, multiplier: multiplier, multiplicand: multiplicand, product: multiplier * multiplicand)
            questions.insert(q)
            index += 1
        }
        return questions
    }
    
}
