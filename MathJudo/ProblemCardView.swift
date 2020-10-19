//
//  ProblemCardView.swift
//  MathJudo
//
//  Created by Amber Spadafora on 10/16/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import SwiftUI

struct ProblemCardView: View {
    
    init(question: Question, problemSolved: @escaping ()->()) {
        self.question = question
        self.problemSolved = problemSolved
    }
    
    var problemSolved: ()->()
    var question: Question
    
    let colors: [Color] = [
    Color(red: 255/255, green: 226/255, blue: 89/255),
    Color(red: 255/255, green: 168/255, blue: 81/255)]
    
    var answers: [Int] {
        var answers: [Int] = []
        while(answers.count < 2) {
            var existingAnswer = 0
            if answers.count == 1 {
                existingAnswer = answers[0]
            }
            let randomAnswer = Int.random(in: 1...80)
            if randomAnswer != question.product && randomAnswer != existingAnswer { answers.append(randomAnswer) }
        }
        let correctAnswer = question.product
        answers.append(correctAnswer)
        return answers
    }
    var correctAnswerIndex: Int {
        print(question.multiplier)
        print(question.multiplicand)
        print(question.product)
        return answers.firstIndex { $0 == question.product } ?? 0
    }
    
    
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: colors),
            startPoint: .top,
            endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 35) {
                Text("\(question.multiplier) X \(question.multiplicand) = ?")
                .font(.title)
                    .frame(width: 150, height: 70)
                .foregroundColor(.white)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .circular))
                
                HStack(spacing: 50) {
                    ForEach(0..<answers.count) { index in
                        Button(action: {
                            //
                            if index == self.correctAnswerIndex {
                                print("User selected the right answer")
                                self.problemSolved()
                            }
                        }) {
                            Text("\(self.answers[index])")
                            .font(.title)
                            .bold()
                            .frame(width: 70, height: 70)
                            .foregroundColor(.white)
                            .background(Color.green)
                            .clipShape(Circle())
                        }

                    }
//                    Button(action: {
//
//                    }) {
//                        Text("5")
//                            .font(.title)
//                        .bold()
//                        .frame(width: 70, height: 70)
//                        .foregroundColor(.white)
//                        .background(Color.green)
//                        .clipShape(Circle())
//                    }
//                    Button(action: {
//
//                    }) {
//                        Text("25")
//                            .font(.title)
//                        .bold()
//                        .frame(width: 70, height: 70)
//                        .foregroundColor(.white)
//                        .background(Color.green)
//                        .clipShape(Circle())
//                    }
//                    Button(action: {
//
//                    }) {
//                        Text("15")
//                            .font(.title)
//                        .bold()
//                        .frame(width: 70, height: 70)
//                        .foregroundColor(.white)
//                        .background(Color.green)
//                        .clipShape(Circle())
//                    }
                }
            }
        }.frame(width: 370, height: 400)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .circular))
            .shadow(radius: 5.0)
        
    }
}

struct ProblemCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProblemCardView(question: Question(id: 0, multiplier: 5, multiplicand: 6, product: 5 * 6), problemSolved: { return } )
    }
}
