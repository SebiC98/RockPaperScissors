//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Sebastian Cioată on 13.03.2023.
//

import SwiftUI

struct ContentView: View {
    
    //@State private var userMove: String
    @State private var winOrLose = Bool.random()
    @State private var score = 0
    @State private var currentRound = 1
    @State private var showAlert = false
    
    @State private var appMove = Int.random(in: 0...2)
    
    let possibleMoves = ["🪨", "📃", "✂️"]
    
    
    var body: some View {
        VStack{
            Text("Score: \(score)")
            Text("Round: \(currentRound)")
            Text(possibleMoves[appMove])
            winOrLose ? Text("You WIN") : Text("You LOSE")
            ForEach(possibleMoves, id:\.self){ move in
                Button(action:{
                    checkMove(move: move)
                }){
                    Text(move)
                }
            }
        }
        .font(.largeTitle)
        .alert("Game over!", isPresented: $showAlert){
            Button("Restart", action: restartGame)
        } message: {
            Text("Your score is \(score)")
        }
    }
    func restartGame(){
        currentRound = 0
        score = 0
        winOrLose.toggle()
        appMove = Int.random(in: 0...2)
        showAlert = true
    }
    
    func checkMove(move: String){
        if currentRound == 10{
           restartGame()
        }else{
            if possibleMoves[appMove] == "🪨"{
                if move == "📃"{
                    if winOrLose{
                        score += 1
                    }else{
                        score += -1
                    }
                }else{
                    if winOrLose{
                        score += -1
                    }else{
                        score += 1
                    }
                }
            }
            if possibleMoves[appMove] == "📃"{
                if move == "✂️"{
                    if winOrLose{
                        score += 1
                    }else{
                        score += -1
                    }
                }else{
                    if winOrLose{
                        score += -1
                    }else{
                        score += 1
                    }
                }
            }
            if possibleMoves[appMove] == "✂️"{
                if move == "🪨"{
                    if winOrLose{
                        score += 1
                    }else{
                        score += -1
                    }
                }else{
                    if winOrLose{
                        score += -1
                    }else{
                        score += 1
                    }
                }
            }
            
            currentRound += 1
            winOrLose.toggle()
            appMove = Int.random(in: 0...2)
        }
    }
    
}
        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
            }
        }
