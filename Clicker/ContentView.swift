//
//  ContentView.swift
//  Clicker
//
//  Created by Paul Colombier on 04/07/2020.
//  Copyright © 2020 Paul Colombier. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var score = 0
    @State var gameIsInProgress = false
    @State var bestScore = 0
    
    var body: some View {
        VStack {
            HStack {
                if self.score >= self.bestScore && self.bestScore != 0 {
                    Image(systemName: "flame")
                }
                Text("Score : \(score)")
            }.font(.title)
                .padding()
            if gameIsInProgress == true {
                Image(systemName: "plus.square")
                    .font(.title)
                    .onTapGesture {
                        self.score = self.score + 1
                }
            }
            Spacer()
            if gameIsInProgress == false {
                Button("Nouvelle Partie") {
                    self.score = 0
                    self.gameIsInProgress = true
                    Timer.scheduledTimer(withTimeInterval: 10.0, repeats: false) { (_) in
                        self.gameIsInProgress = false
                        if self.score > self.bestScore {
                            self.bestScore = self.score
                        }
                    }
                }.padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
