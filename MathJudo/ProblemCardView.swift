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
        //self.answers = ProblemCardView.generateAnswers(product: question.product).shuffled()
    }
    
    var problemSolved: ()->()
    var question: Question
    //var answers: [Int]
    
    let colors: [Color] = [
    Color(red: 255/255, green: 226/255, blue: 89/255),
    Color(red: 255/255, green: 168/255, blue: 81/255)]
    
    
    
    
    
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: colors),
            startPoint: .top,
            endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 35) {
                Text("\(question.multiplier) X \(question.multiplicand) = ?")
                .font(Font.custom("Carnetdevoyage", size: 53))
                    .frame(width: 300, height: 150)
                .foregroundColor(.white)
                .background(Color.green)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .circular))
                
                HStack(spacing: 50) {
                    ForEach(0..<self.question.answers.count) { index in
                        Button(action: {
                            if self.question.answers[index] == self.question.product {
                                print("User selected the right answer")
                                self.problemSolved()
                            }
                        }) {
                            Text("\(self.question.answers[index])")
                            .font(Font.custom("Carnetdevoyage", size: 48))
                            .bold()
                            .frame(width: 70, height: 70)
                            .foregroundColor(.black)
                            .background(Color.green)
                            .clipShape(Circle())
                        }

                    }
                }
            }
        }.frame(width: 370, height: 400)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .circular))
            .shadow(radius: 2.0)
        
    }
}

struct ProblemCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProblemCardView(question: Question(id: 0, multiplier: 5, multiplicand: 6, product: 5 * 6, answers: []), problemSolved: { return } )
    }
}
