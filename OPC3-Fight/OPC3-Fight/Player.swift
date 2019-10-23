//
//  Player.swift
//  OPC3-Fight
//
//  Created by WANDIANGA on 13/09/2019.
//  Copyright © 2019 WANDIANGA. All rights reserved.
//

import Foundation

internal class Player {
    
    var name : String
    var team = [Character]()
    private var nameSetCharacter = Set<String>()
    
    init(name : String) {
        
        self.name = name
        
    }
    
    func teamPresentation() {
        
        var index = 0
        
        print("Nom Joueur : \(name)")
        
        for character in team {
            
            print("Number \(index), Player : \(name), Character : \(character.name), life : \(character.life), Weapon : \(character.weapon.name), Damage : \(character.weapon.damage)")
            
            index += 1
            
        }
        
    }
    
    private func createCharacter(character : Character) {
        
        print("Choose the name of your character")
        
        let nameCharacter = readLine()
        
        if let nameCharacter = nameCharacter  {
            
            if verificationName(name: nameCharacter) == true {
                
                let perso = character
                perso.name = nameCharacter
                
                print("The name of your warrior is \(perso.name)")
                
                team.append(perso)
                
            } else {
                
                createCharacter(character: character)
                
            }
        }
        
    }
    
    
    func createTeam() {
        
        while team.count <= 2 {
            
            print("Choose a character between: warrior, dwarf, magus, colossus")
            
            let answer = readLine()
            
            if let answer = answer {
                
                switch answer.lowercased() {
                    
                case "warrior":
                    
                    let warriorWeapon = Weapon(name: "Sword", damage: 100)
                    let warrior = Warrior(name: "", life: 100, weapon: warriorWeapon)
                    
                    createCharacter(character: warrior)
                    
                case "dwarf":
                    
                    let dwarfWeapon = Weapon(name: "Axe", damage: 100)
                    let dwarf = Dwarf(name: "", life: 100, weapon: dwarfWeapon)
                    
                    createCharacter(character: dwarf)
                    
                case "magus":
                    
                    let magusWeapon = Weapon(name: "Scepter", damage: 100)
                    let magus = Magus(name: "", life: 100, weapon: magusWeapon)
                    
                    createCharacter(character: magus)
                    
                case "colossus":
                    
                    let colossusWeapon = Weapon(name: "Mace", damage: 100)
                    let colossus = Colossus(name: "", life: 100, weapon: colossusWeapon)
                    
                    createCharacter(character: colossus)
                    
                default:
                    
                    print("Type of unrecognized character")
                    
                }
                
            }
            
        }
        
    }
    
    private func verificationName(name : String) -> Bool {
        
        if nameSetCharacter.contains(name) {
            
            print("This name is already present in the table. Please choose another name ?")
            
            return false
            
        } else  {
            
            nameSetCharacter.insert(name)
            
            return true
        }
        
    }
    
    func characterChoice() -> Character? {
        
        print("Select your character number")
        
        let reponse = readLine()
        
        if let reponse = reponse {
            
            if let reponseIndex = Int(reponse) {
                
                if team.indices.contains(reponseIndex) {
                    
                    return team[reponseIndex]
                    
                } else {
                    
                    print("This player does not exist, try again ?")
                    
                    return characterChoice()
                    
                }
                
            }
            
        }
        
        return nil
    }
    
    func caringCharacter() {
        
        guard let character = characterChoice() else { print("No character chosen"); return  }
        
        character.care()
        
        print("Character \(character.name), Your new life points are:\(character.life)")
        
    }
    
    func playerAttack(adversary: Player) {
        
        teamPresentation()
        
        if let attacker = characterChoice() {
            
            print("Which characters of the opposing team, do you want to attack?")
            
            adversary.teamPresentation()
            
            if let attacking = adversary.characterChoice() {
                
                attacker.attack(adversary : attacking)
                
                if attacking.life == 0 {
                    
                    print("Attack Summary: \(attacker.name) just attack \(attacking.name) and you still have \(attacking.life) life.")
                    
                } else if attacking.life < 0 {
                    
                    print("Attack Summary: \(attacker.name) just attack \(attacking.name) and you still have 0 life.")
                    
                }
                
            }
            
        }
        
    }
    
    func livingCharacterInTeam() -> Bool {
        
        for character in team {
            
            if character.life > 0 {
                
                return true
                
            }
            
        }
        
        return false
        
    }
    
    private func deadCharacterCounter(character : Character) -> Int {
        
        var counter = 0
        
        for character in team  {
            
            if character.life <= 0  {
                
                return counter
                
            }
            
            counter += 1
            
        }
        
        return counter
    }
    
    func deadCharacter()  {
        
        for character in team  {
            
            if character.life <= 0 {
                
                team.remove(at: deadCharacterCounter(character : character))
                
            }
            
        }
        
    }
    
}

