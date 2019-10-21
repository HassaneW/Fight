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
    var nameSetCharacter = Set<String>()
    
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
    
    /*
     
     func retryW () {
     
     let nameCharacter = readLine()
     
     if let nameCharacter = nameCharacter {
     
     if verificationName(name: nameCharacter) == true {
     
     let warriorWeapon = Weapon(name: "Sword", damage: 100)
     let warrior = Warrior(name: nameCharacter, life: 100, weapon: warriorWeapon)
     
     print("The name of your warrior is \(warrior.name)")
     
     team.append(warrior)
     
     }
     
     }
     
     }
     
     func createWarrior() {
     
     print("Choose the name of your character")
     
     let nameCharacter = readLine()
     
     guard let nameCharacterS = nameCharacter, verificationName(name: nameCharacterS) == true else { return  retryW() }
     
     let warriorWeapon = Weapon(name: "Sword", damage: 100)
     let warrior = Warrior(name: nameCharacterS, life: 100, weapon: warriorWeapon)
     
     print("The name of your warrior is \(warrior.name)")
     
     team.append(warrior)
     }
     
     
     func createCharacter() {
     
     while team.count <= 2 {
     
     print("Choose a character between: warrior, dwarf, magus, colossus")
     
     let answer = readLine()
     
     if let answer = answer {
     
     switch answer.lowercased() {
     
     case "warrior":
     
     testNomPerso()
     
     default:
     
     print("Type of unrecognized character")
     
     }
     
     }
     
     }
     
     }
     
     */
    
    /*
     func retryW() {
     
     let nameCharacter = readLine()
     
     if let nameCharacter = nameCharacter {
     
     if verificationName(name: nameCharacter) == true {
     
     let warriorWeapon = Weapon(name: "Sword", damage: 100)
     let warrior = Warrior(name: nameCharacter, life: 100, weapon: warriorWeapon)
     
     print("The name of your warrior is \(warrior.name)")
     
     team.append(warrior)
     
     }
     
     }
     
     }
     
     func createWarrior() {
     
     print("Choose the name of your character")
     
     let nameCharacter = readLine()
     
     if let nameCharacter = nameCharacter  {
     
     guard nameCharacter == nameCharacter, verificationName(name: nameCharacter) == true else { return createWarrior()  }
     
     let warriorWeapon = Weapon(name: "Sword", damage: 100)
     let warrior = Warrior(name: nameCharacter, life: 100, weapon: warriorWeapon)
     
     print("The name of your warrior is \(warrior.name)")
     
     team.append(warrior)
     
     }
     
     }
     
     */
    
    /*
    
    func retryW() {
        
        print("Choose the name of your character")
        
        let nameCharacter = readLine()
        
        
    }
    
 */
    
    
    func createWarrior(perso : Character) {
        
        print("Choose the name of your character")
        
        let nameCharacter = readLine()
        
        if let nameCharacter = nameCharacter  {
            
            if verificationName(name: nameCharacter) == true {
                
                let persoArme = perso.weapon
                let perso = perso
                perso.name = nameCharacter
                
                print("The name of your warrior is \(perso.name)")
                
                team.append(perso)
                
            } else {
                
                createWarrior(perso: perso)
                
                
            }
            }
        

    }
    

 
    func createCharacter() {
        
        while team.count <= 2 {
            
            print("Choose a character between: warrior, dwarf, magus, colossus")
            
            let answer = readLine()
            
            if let answer = answer {
                
                switch answer.lowercased() {
                    
                case "warrior":
                    
                   let warriorWeapon = Weapon(name: "Sword", damage: 100)
                   let warrior = Warrior(name: "", life: 100, weapon: warriorWeapon)
                    
                   createWarrior(perso: warrior)
                    
                    /*
                    print("Choose the name of your character")
                    
                    let nameCharacter = readLine()
                    
                    if let nameCharacter = nameCharacter  {
                        
                        guard nameCharacter == nameCharacter, verificationName(name: nameCharacter) == true else {
    
                            
                            print("Choose the name of your character")
                            
                            let nameCharacter = readLine()
                            
                            fallthrough
                
                        }
            
                    
                    
                        let warriorWeapon = Weapon(name: "Sword", damage: 100)
                        let warrior = Warrior(name: nameCharacter, life: 100, weapon: warriorWeapon)
                        
                        print("The name of your warrior is \(warrior.name)")
                        
                        team.append(warrior)
                        
                    }
                    
     */
                   
                case "dwarf":
                    
                    print("Choose the name of your character")
                    
                    let nameCharacter = readLine()
                    
                    if let nameCharacter = nameCharacter {
                        
                        if verificationName(name: nameCharacter) == true {
                            
                            let dwarfWeapon = Weapon(name: "Axe", damage: 100)
                            let dwarf = Dwarf(name: nameCharacter, life: 100, weapon: dwarfWeapon)
                            
                            print("The name of your dwarf is \(dwarf.name)")
                            
                            team.append(dwarf)
                            
                        } else {
                            
                            let nameCharacter = readLine()
                            
                            if let nameCharacter = nameCharacter { // guard let
                                
                                if verificationName(name: nameCharacter) == true {
                                    
                                    let dwarfWeapon = Weapon(name: "Axe", damage: 100)
                                    let dwarf = Dwarf(name: nameCharacter, life: 100, weapon: dwarfWeapon)
                                    
                                    print("The name of your dwarf is \(dwarf.name)")
                                    
                                    team.append(dwarf)
                                    
                                }
                                
                            }
                            
                        }
                        
                    }
                    
                case "magus":
                    
                    print("Choose the name of your character")
                    
                    let nameCharacter = readLine()
                    
                    if let nameCharacter = nameCharacter {
                        
                        if verificationName(name: nameCharacter) == true {
                            
                            let magusWeapon = Weapon(name: "Scepter", damage: 100)
                            let magus = Magus(name: nameCharacter, life: 100, weapon: magusWeapon)
                            
                            print("The name of your magus is \(magus.name)")
                            
                            team.append(magus)
                            
                        } else {
                            
                            let nameCharacter = readLine()
                            
                            if let nameCharacter = nameCharacter {
                                
                                if verificationName(name: nameCharacter) == true {
                                    
                                    let magusWeapon = Weapon(name: "Scepter", damage: 100)
                                    let magus = Magus(name: nameCharacter, life: 100, weapon: magusWeapon)
                                    
                                    print("The name of your magus is \(magus.name)")
                                    
                                    team.append(magus)
                                    
                                }
                                
                            }
                            
                        }
                        
                    }
                    
                case "colossus":
                    
                    print("Choose the name of your character")
                    
                    let nameCharacter = readLine()
                    
                    if let nameCharacter = nameCharacter {
                        
                        if verificationName(name: nameCharacter) == true {
                            
                            let colossusWeapon = Weapon(name: "Mace", damage: 100)
                            let colossus = Colossus(name: nameCharacter, life: 100, weapon: colossusWeapon)
                            
                            print("The name of your colossus is \(colossus.name)")
                            
                            team.append(colossus)
                            
                        } else {
                            
                            let nameCharacter = readLine()
                            
                            if let nameCharacter = nameCharacter {
                                
                                if verificationName(name: nameCharacter) == true {
                                    
                                    let colossusWeapon = Weapon(name: "Mace", damage: 10)
                                    let colossus = Colossus(name: nameCharacter, life: 100, weapon: colossusWeapon)
                                    
                                    print("The name of your colossus is \(colossus.name)")
                                    
                                    team.append(colossus)
                                    
                                }
                                
                            }
                            
                        }
                        
                    }
                    
                default:
                    
                    print("Type of unrecognized character")
                    
                }
                
            }
            
        }
        
    }
    
    func verificationName(name : String) -> Bool {
        
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
    
    func personalCare() {
        
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
    
    func livingCharacter() -> Bool {
        
        for character in team {
            
            if character.life > 0 {
                
                return true
                
            }
            
        }
        
        return false
        
    }
    
    func searchCharacter(character : Character) -> Int {
        
        var counter = 0
        
        for character in team  {
            
            if character.life <= 0  {
                
                return counter
                
            }
            
            counter += 1
            
        }
        
        return counter
    }
    
    func removeCharacter()  {
        
        for character in team  {
            
            if character.life <= 0 {
                
                team.remove(at: searchCharacter(character : character))
                
            }
            
        }
        
    }
    
}


/*
 
 func retryW () {
 
 let nameCharacter = readLine()
 
 if let nameCharacter = nameCharacter {
 
 if verificationName(name: nameCharacter) == true {
 
 let warriorWeapon = Weapon(name: "Sword", damage: 100)
 let warrior = Warrior(name: nameCharacter, life: 100, weapon: warriorWeapon)
 
 print("The name of your warrior is \(warrior.name)")
 
 team.append(warrior)
 
 }
 
 }
 
 }
 
 func createWarrior() {
 
 print("Choose the name of your character")
 
 let nameCharacter = readLine()
 
 guard let nameCharacterS = nameCharacter, verificationName(name: nameCharacterS) == true else { return  retryW() }
 
 let warriorWeapon = Weapon(name: "Sword", damage: 100)
 let warrior = Warrior(name: nameCharacterS, life: 100, weapon: warriorWeapon)
 
 print("The name of your warrior is \(warrior.name)")
 
 team.append(warrior)
 }
 
 
 func createCharacter() {
 
 while team.count <= 2 {
 
 print("Choose a character between: warrior, dwarf, magus, colossus")
 
 let answer = readLine()
 
 if let answer = answer {
 
 switch answer.lowercased() {
 
 case "warrior":
 
 testNomPerso()
 
 default:
 
 print("Type of unrecognized character")
 
 }
 
 }
 
 }
 
 }
 
 */






