//
//  Player.swift
//  OPC3-Fight
//
//  Created by WANDIANGA on 13/09/2019.
//  Copyright © 2019 WANDIANGA. All rights reserved.
//

import Foundation

class Player {
    
    var name : String
    var team = [Character]()
    
    init(name : String) {
        
        self.name = name
        
    }
    
    func presentationTeam() {
        
        var index = 0
        
        for character in team {
            
            print("Number \(index), Player : \(name), Character : \(character.name), life : \(character.life), Weapon : \(character.weapon.name), Damage : \(character.weapon.damage)")
            
            index += 1
            
        }
    }
    
    func createTeam() {
        
        for index in 1...3 {
            
            print("Create a character")
            
            let character = readLine()
            
            if let character = character {
                
                if character == "Warrior" {
                    
                    let warriorWeapon = Weapon(name: "Sword", damage: 10)
                    
                    let warrior = Warrior(name: "", life: 100, weapon: warriorWeapon)
                    
                    print("Enter your character's name")
                    
                    let warriorName = readLine()
                    
                    if let warriorName = warriorName {
                        
                        warrior.name = warriorName
                        
                        team.append(warrior)
                        
                    }
                    
                } else if character == "Dwarf" {
                    
                    let dwarfWeapon = Weapon(name: "Axe", damage: 10)
                    
                    let dwarf = Dwarf(name: "", life: 100, weapon: dwarfWeapon)
                    
                    print("Enter your character's name")
                    
                    let dwarfName = readLine()
                    
                    if let dwarfName = dwarfName {
                        
                        dwarf.name = dwarfName
                        
                        team.append(dwarf)
                        
                    }
                    
                } else if character == "Magus" {
                    
                    let magusWeapon = Weapon(name: "Scepter", damage: 10)
                    
                    let magus = Magus(name: "", life: 100, weapon: magusWeapon)
                    
                    print("Enter your character's name")
                    
                    let magusName = readLine()
                    
                    if let magusName = magusName {
                        
                        magus.name = magusName
                        
                        team.append(magus)
                        
                    }
                    
                } else if character == "Colossus" {
                    
                    let colossusWeapon = Weapon(name: "Mace", damage: 10)
                    
                    let colossus = Colossus(name: "", life: 100, weapon: colossusWeapon)
                    
                    print("Enter your character's name")
                    
                    let colossusName = readLine()
                    
                    if let colossusName = colossusName {
                        
                        colossus.name = colossusName
                        
                        team.append(colossus)
                        
                    }
                    
                }
    
            }
            
        }
    }
    
    func characterChoice() -> Character {
        
        let weapon = Weapon(name: "", damage: 0)
        
        var character = Character(name: "", life: 0, weapon: weapon)
        
        print("Select a character")
        
        let characterChoice = readLine()
        
        let newChoice = Int(characterChoice!)
        
        if let newChoice = newChoice {
            
            if newChoice == 0 {
                
                print("\(team[0].name)")
                
                character = team[0]
                
            } else if newChoice == 1 {
                
                print("\(team[1].name)")
                
                character = team[1]
                
            } else if newChoice == 2 {
                
                print("\(team[2].name)")
                
                character = team[2]
                
            }
        }
        
        return character
        
    }
    
    func personalCare() -> Character {
        
        let weapon = Weapon(name: "", damage: 0)
        
        var character = Character(name: "", life: 0, weapon: weapon)
        
        print("Select a character")
        
        let characterChoice = readLine()
        
        let newChoice = Int(characterChoice!)
        
        if let newChoice = newChoice {
            
            if newChoice == 0 {
                
                print("You chose: \(team[0].name)")
                
               print("Want to heal your character ? Yes or No")
                
                let response = readLine()
                
                if let response = response {
                    
                    if response == "Yes" {
                        
                        team[0].care()
                        
                        print("Your new health points are from : \(team[0].life)")
                        
                    } else if response == "No" {
                        
                        personalCare()
                    }
                }
                
            } else if newChoice == 1 {
                
                print("You chose: \(team[1].name)")
                
                print("Want to heal your character ? Yes or No")
                
                let response = readLine()
                
                if let response = response {
                    
                    if response == "Yes" {
                        
                        team[1].care()
                        
                        print("Your new health points are from : \(team[1].life)")
                        
                    } else if response == "No" {
                        
                        personalCare()
                    }
                }
                
            } else if newChoice == 2 {
                
                print("You chose: \(team[2].name)")
                
                print("Want to heal your character ? Yes or No")
                
                let response = readLine()
                
                if let response = response {
                    
                    if response == "Yes" {
                        
                        team[2].care()
                        
                        print("Your new health points are from : \(team[2].life)")
                        
                    } else if response == "No" {
                        
                        personalCare()
                    }
                }
        
            }
        }
        
         return character
    }
    
    func playerAttack(adversary : Player) {
        
        presentationTeam()
        
        adversary.presentationTeam()
        
          print("Select a character")
        
        var characterOne = characterChoice()
        
        var characterTwo = adversary.characterChoice()
        
        characterOne.attack(adversary: characterTwo)
        
        print(characterTwo.life)
        
    }
    
}


