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
    
    func create2Players () {
        
        for counter in 1...2 {
            
            print("Enter the player's name \(counter) ?")
            
            let namePlayer = readLine()
            
            if let namePlayer = namePlayer {
                
                let player = Player(name: namePlayer)
                
                
            }
            
        }
    }
    
}
