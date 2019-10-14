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
                
                player.createCharacter()
                
                
                
            }
            
        }
        
        
        
    }
    
    
    func    part() {
        
        
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
                    
                    deadTeam()
                    
                    winner()
                    
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
                    
                    deadTeam()
                    
                    winner()
                    
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
        
        
        
    }
    
    
    func deadTeam() {
        
        if  players[0].livingCharacter() == false {
            
            print("All your players are dead")
            
        } else if players[1].livingCharacter() == false {
            
            print("All your players are dead")
            
        }
        
    }
    
    func winner()  {
        
        if players[0].livingCharacter() == true && players[1].livingCharacter() == false {
            
            print("The Winner is \(players[0].name)")
            
        } else if players[0].livingCharacter() == false && players[1].livingCharacter() == true {
            
            print("The winner is \(players[1].name)")
            
        }
        
    }
    
    
    func gameStart()  {
        
        create2Players ()
        part()
        
    }
    
    
    
    
    
    
}
