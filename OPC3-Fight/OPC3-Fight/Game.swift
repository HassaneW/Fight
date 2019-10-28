//
//  Game.swift
//  OPC3-Fight
//
//  Created by WANDIANGA on 13/09/2019.
//  Copyright © 2019 WANDIANGA. All rights reserved.
//

import Foundation

// MARK: - Initialization

internal class Game {
    
    var players = [Player]()
    
    // Creation of players and their teams
    func createPlayers() {
        
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
    
// MARK: - Game
    
    // Launch of the game
    func start()  {
        
        print("\nWelcome to the game by W.\n")
        
        createPlayers ()
        
        fight()
        
        newGame()
        
    }
    
// Play of a game between players
    func fight() {
        
        var counterCare1 = 0
        var compteurOne = 0
        var compteurTwo = 0
        var counterCare2 = 0
        
        while players[0].livingCharacterInTeam() && players[1].livingCharacterInTeam() {
            
            print("Your turn to play \(players[0].name). Attack or Care")
            
            let answer = readLine()
            
            if let answer = answer {
                
                if answer == "Care" {
                    
                    counterCare1 += 1
                    
                    players[0].teamPresentation()
                    
                    players[0].caringCharacter()
                    
                } else if answer == "Attack" {
                    
                    players[0].playerAttack(adversary: players[1])
                    
                    players[1].deadCharacter()
                    
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
                    
                    players[1].caringCharacter()
                    
                    counterCare2 += 1
                    
                } else if answer2 == "Attack" {
                    
                    players[1].playerAttack(adversary: players[0])
                    
                    players[0].deadCharacter()
                    
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

// MARK: - Winner
    
// Winner's design
    func winner()  {
        
        if players[0].livingCharacterInTeam() == true && players[1].livingCharacterInTeam() == false {
            
            print("\n------All your players are dead player : \(players[1].name)")
            
            print("\n------The Winner is \(players[0].name)------\n")
            
        } else if players[0].livingCharacterInTeam() == false && players[1].livingCharacterInTeam() == true {
            
            print("\n------All your players are dead player : \(players[0].name)")
            
            print("\n------The winner is \(players[1].name)\n")
            
        }
        
    }
    
// MARK: - Restart
    
// New part
    private func newGame() {
        
        print("\nSee you soon for a new game ? Yes or No")
        
        let reponse = readLine()
        
        if let reponse = reponse {
            
            if reponse == "Yes" {
                
                start()
                
            } else if reponse == "No" {
                
                return
                
            }
            
        }
        
    }
    
}
