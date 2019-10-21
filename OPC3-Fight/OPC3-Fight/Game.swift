//
//  Game.swift
//  OPC3-Fight
//
//  Created by WANDIANGA on 13/09/2019.
//  Copyright © 2019 WANDIANGA. All rights reserved.
//

import Foundation


class Game {
    
    var players = [Player]()
    var team = [Character]()
    
    func create2Players() {
        
        for counter in 1...2 {
            
            print("Enter your name player \(counter)")
            
            let playerName = readLine()
            
            if let playerName = playerName {
                
                let player = Player(name: playerName)
                
                players.append(player)
                
                player.createTeam()
                
            }
            
        }
        
    }
    
    
    func fight() {
        
        var counterCare1 = 0
        var compteurOne = 0
        var compteurTwo = 0
        var counterCare2 = 0
        
        while players[0].livingCharacter() && players[1].livingCharacter() {
            
            print("Your turn to play \(players[0].name). Attack or Care")
            
            let answer = readLine()
            
            if let answer = answer {
                
                if answer == "Care" {
                    
                    counterCare1 += 1
                    
                    players[0].teamPresentation()
                    
                    players[0].personalCare()
                    
                } else if answer == "Attack" {
                    
                    players[0].playerAttack(adversary: players[1])
                    
                    players[1].removeCharacter()
                    
                    deadWin()
                    
                    compteurOne += 1
                    
                    if players[1].team.count == 0 {
                        
                        break
                    }
                    
                }
                
            }
            
            print("Your turn to play \(players[1].name). Attack or Care")
            
            let answer2 = readLine()
            
            if let answer2 = answer2 {
                
                if answer2 == "Care" {
                    
                    players[1].teamPresentation()
                    
                    players[1].personalCare()
                    
                    counterCare2 += 1
                    
                } else if answer2 == "Attack" {
                    
                    players[1].playerAttack(adversary: players[0])
                    
                    players[0].removeCharacter()
                    
                    deadWin()
                    
                    compteurTwo += 1
                    
                    if players[0].team.count == 0 {
                        
                        break
                    }
                    
                }
                
            }
            
        }
        
        print("""
            Statistics part:
            
            Player One : \(players[0].name),
            Care performed: \(counterCare1),
            Attack performed : \(compteurOne),
            
            Player Two : \(players[1].name),
            Care performed: \(counterCare2),
            Attack performed : \(compteurTwo),
            """)
        
        print("See you soon for a new game")
        
    }
    
    func start()  {
        
        print("Welcome to the game by W.\n")
        
        create2Players ()
        
        fight()
        
    }
    
    func deadWin()  {
        
        if players[0].livingCharacter() == true && players[1].livingCharacter() == false {
            
            print("\n------All your players are dead player : \(players[1].name)")
            
            print("\n------The Winner is \(players[0].name)------\n")
            
        } else if players[0].livingCharacter() == false && players[1].livingCharacter() == true {
            
            print("\n------All your players are dead player : \(players[0].name)")
            
            print("\n------The winner is \(players[1].name)\n")
            
        }
        
    }
    
}
