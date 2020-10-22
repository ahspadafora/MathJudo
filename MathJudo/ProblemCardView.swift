//
//  ProblemCardView.swift
//  MathJudo
//
//  Created by Amber Spadafora on 10/16/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import SwiftUI

struct ProblemCardView: View {
    
    init(question: Question, problemSolved: @escaping (_ answeredCorrectly: Bool)->()) {
        self.question = question
        self.problemSolved = problemSolved
    }
    
    var problemSolved: (_ answeredCorrectly: Bool)->()
    var question: Question
    
    let answerButtonBackgroundColor: Color =
        Color(red: 233/255, green: 208/255, blue: 158/255)
    
    func userAnsweredCorrectly(selectedIndex: Int?) -> Bool {
        guard let selectedIndex = selectedIndex else { return false }
        return self.question.answers[selectedIndex] == self.question.product
    }
    
    @State private var selectedAnAnswer: Bool = false
    @State private var selectedIndex: Int?
    
    var body: some View {
        let problem = Text("\(question.multiplier) X \(question.multiplicand) = ?")
        .font(Font.custom("Carnetdevoyage", size: 48))
        .foregroundColor(.black)
        
        let correctAnswer = Image("menuButton")
        //let incorrectAnswer = Image("wrongButton")
        
       return VStack(spacing: 35) {
            ZStack {
                Image("buttonBackground")
                if selectedAnAnswer {
                    if userAnsweredCorrectly(selectedIndex: self.selectedIndex) {
                        correctAnswer.transition(.scale)
                    } else {
                        problem.transition(.scale)
                    }
                } else { problem }
            }
            
            HStack(spacing: 20) {
                ForEach(0..<self.question.answers.count) { index in
                    Button(action: {
                        self.selectedAnAnswer = true
                        self.selectedIndex = index
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            self.problemSolved(self.userAnsweredCorrectly(selectedIndex: index))
                        }
                    }) {
                        Text(String(self.question.answers[index]))
                            .font(Font.custom("Carnetdevoyage", size: 38))
                            .bold()
                            .frame(width: 130, height: 70)
                            .foregroundColor(.black)
                            .background(self.answerButtonBackgroundColor)
                            .clipShape(Circle())
                    }
                    
                }
            }
        }
        
        
    }
}

struct ProblemCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProblemCardView(question: Question(id: 0, multiplier: 5, multiplicand: 6, product: 5 * 6, answers: []), problemSolved: { _ in return } )
    }
}
