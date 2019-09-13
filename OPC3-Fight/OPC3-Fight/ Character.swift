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
    
}
