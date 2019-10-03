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
    
    func teamPresentation() {
        
        var index = 0
        
       print("Nom Joueur : \(name)")
        
        for character in team {
            
          print("Number \(index), Player : \(name), Character : \(character.name), life : \(character.life), Weapon : \(character.weapon.name), Damage : \(character.weapon.damage)")
                       
                       index += 1
    
            
        }
        
    }
    
    
    
    func createCharacter() {
        
        var nameSetCharacter = Set<String>()
        
        let weapon = Weapon(name: "", damage: 0)
        let character = Character(name: "", life: 0, weapon: weapon)
        
        let warriorWeapon = Weapon(name: "Sword", damage: 10)
        let warrior = Warrior(name: "", life: 100, weapon: warriorWeapon)
        let dwarfWeapon = Weapon(name: "Axe", damage: 10)
        let dwarf = Dwarf(name: "", life: 100, weapon: dwarfWeapon)
        let magusWeapon = Weapon(name: "Scepter", damage: 10)
        let magus = Magus(name: "", life: 100, weapon: magusWeapon)
        let colossusWeapon = Weapon(name: "Mace", damage: 10)
        let colossus = Colossus(name: "", life: 100, weapon: colossusWeapon)
                              
                           
        for index in 1...3 {
            
            print("Choose a character between: warrior, dwarf, mage, colossus")
                   
                   let answer = readLine()
                   
                   if let answer = answer {
                       
                       switch answer.lowercased() {
                               
                           case "warrior":
                               
                               print("Choose the name of your character")
                               
                               let nameCharacter = readLine()
                               
                                verificationName(name: nameCharacter!, arraySet: nameSetCharacter)
                               
                               if let nameCharacter = nameCharacter {
                                   
                                warrior.name = nameCharacter
                                   
                                   print("The name of your warrior is \(warrior.name)")
                                   
                                   team.append(warrior)
                                   
                                   
                        }
                        
                       case "dwarf":
                        
                       print("Choose the name of your character")
                                                   
                                                   let nameCharacter = readLine()
                                                   
                                                    verificationName(name: nameCharacter!, arraySet: nameSetCharacter)
                                                   
                                                   if let nameCharacter = nameCharacter {
                                                       
                                                    dwarf.name = nameCharacter
                                                       
                                                       print("The name of your dwarf is \(dwarf.name)")
                                                       
                                                       team.append(dwarf)
                                               
                                               
                                           }
                        
                       case "magus":
                        
                         print("Choose the name of your character")
                                                                          
                        let nameCharacter = readLine()
                                                                          
                        verificationName(name: nameCharacter!, arraySet: nameSetCharacter)
                                                                          
                        if let nameCharacter = nameCharacter {
                                                                              
                            magus.name = nameCharacter
                                                                              
                        print("The name of your dwarf is \(magus.name)")
                                                                              
                        team.append(magus)
                                             
                                         }
                        
                       case "colosse":
                        
                        print("Choose the name of your character")
                                                                                                                        
                                                let nameCharacter = readLine()
                                                                                                 
                                                verificationName(name: nameCharacter!, arraySet: nameSetCharacter)
                                                                                                 
                                                if let nameCharacter = nameCharacter {
                                                                                                     
                                                colossus.name = nameCharacter
                                                                                                     
                                                print("The name of your colossus is \(colossus.name)")
                                                                                                     
                                                team.append(colossus)
                        }
                               
                           default:
                               print("Type of unrecognized character")
                        
                                }
                        
                            }
                           
                       }
                       
                   }
        
        
    func verificationName(name : String, arraySet: Set<String>) {
        
        var arraySet = Set<String>()
        
            if arraySet.contains(name) {
                
             print("This name is already present in the table. Please choose another name, please?")
                
                let nameCharacter = readLine()
                
            } else {
                
                arraySet.insert(name)
        }
            
        
        
    }
        
            
     func characterChoice() -> Character? {
        
        let weapon = Weapon(name: "", damage: 0)
        var character = Character(name: "", life: 0, weapon: weapon)
        
        print("Select a character : 0, 1, 2")
        
        let characterChoice = readLine()
        
        let newChoice = Int(characterChoice!)
        
         if let newChoice = newChoice {
            
            switch newChoice {
                
            case 0:
                return team[0]
                
            case 1:
                return team[1]
                
            case 2:
                return team[2]
                
            default:
                return nil
                
                
            }
            
        }
        
        return character
    }
        
        
        func personalCare() {
            
            guard let character = characterChoice() else { print("No character chosen"); return  }
            
            character.care()
        
            print("Character \(character.name), Your new life points are:\(character.life)")
        }
        
       
    func playerAttack(adversary: Player) {
        
        
        teamPresentation()
        
        let attacker = characterChoice()!
        
        print("Which characters of the opposing team, do you want to attack?")
        
        adversary.teamPresentation()
        
        let attacking = adversary.characterChoice()!
        
        attacker.attack(adversary : attacking)
        
        print("Attack Summary: \(attacker.name) just attack \(attacking.name) and you still have \(attacking.life) life.")
        
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







