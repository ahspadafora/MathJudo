//
//  ContentView.swift
//  MathJudo
//
//  Created by Amber Spadafora on 10/15/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import SwiftUI

/*
 To Do:
 - Build Problem Card (View)
 -
 
 */

//UIColor(red: 255, green: 226, blue: 89, alpha: 1)
//UIColor(red: 255, green: 167, blue: 81, alpha: 1))

struct ContentView: View {
    let settingsView = SettingsView()
    // @State private var isPresenting = false
    
    
    var body: some View {
        //        let playButton = Button("Play Game") {
        //            self.isPresenting.toggle()
        //        }
        ZStack {
            Image("background").resizable().scaledToFill().edgesIgnoringSafeArea(.all)
            VStack {
                
                SettingsView().frame(width: 370).padding()
                
                Spacer()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
