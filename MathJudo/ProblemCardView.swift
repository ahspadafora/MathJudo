//
//  ProblemCardView.swift
//  MathJudo
//
//  Created by Amber Spadafora on 10/16/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import SwiftUI

struct ProblemCardView: View {
    var question: Question = Question(id: 0, multiplier: 5, multiplicand: 5, product: 5 * 5)
    
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
                .font(.title)
                    .frame(width: 150, height: 70)
                .foregroundColor(.white)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .circular))
                
                HStack(spacing: 50) {
                    Button(action: {
                        
                    }) {
                        Text("5")
                            .font(.title)
                        .bold()
                        .frame(width: 70, height: 70)
                        .foregroundColor(.white)
                        .background(Color.green)
                        .clipShape(Circle())
                    }
                    Button(action: {
                        
                    }) {
                        Text("25")
                            .font(.title)
                        .bold()
                        .frame(width: 70, height: 70)
                        .foregroundColor(.white)
                        .background(Color.green)
                        .clipShape(Circle())
                    }
                    Button(action: {
                        
                    }) {
                        Text("15")
                            .font(.title)
                        .bold()
                        .frame(width: 70, height: 70)
                        .foregroundColor(.white)
                        .background(Color.green)
                        .clipShape(Circle())
                    }
                }
            }
        }.frame(width: 370, height: 400)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .circular))
            .shadow(radius: 5.0)
        
    }
}

struct ProblemCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProblemCardView()
    }
}
