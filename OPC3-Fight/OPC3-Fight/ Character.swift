//
//   Character.swift
//  OPC3-Fight
//
//  Created by WANDIANGA on 13/09/2019.
//  Copyright © 2019 WANDIANGA. All rights reserved.
//

import Foundation


class Character {
    
    var name : String
    var life : Int
    var weapon : Weapon
    
    init(name : String, life : Int, weapon : Weapon) {
        
        self.name = name
        self.life = life
        self.weapon = weapon
    }
    
    func care()  {
        
        life = life + 20
    }
    
    func attack(adversary : Character) -> Character {
        
        magicChest()
        
        adversary.life = adversary.life - weapon.damage
        
        return adversary
    }
    
    func magicChest() {
        
        var number : Int = 0
        number = Int.random(in: 2...100)
        
        if number % 5 == 0 {
            
            weapon.damage = weapon.damage + weapon.damage
            
            print("You have just doubled the power of your attack thanks to the magic chest")
        }
    }
}
