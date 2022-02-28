//
//  Enemy.swift
//  HelloWorld
//
//  Created by Vntlab on 7/11/16.
//  Copyright © 2016 Vntlab. All rights reserved.
//

import Foundation

class Enemy: MoveProtocol {

    /*
     *  ATTRIBUTES
     */
    var healthPoints: Int = 300
    var enemyState: EnemyStates = EnemyStates.Idle
    var name: String?

    
    // Construtor inicial
    init(){}
    
    // Override Construtor
    init(healthPoints: Int) {
        self.healthPoints = healthPoints
    }
    
    // Status dos inimigos
    enum EnemyStates{
        case Idle
        case Attacking
        case Moving
    }
    
    // Struct of postion
    struct InitialPosition {
        var posX: Int = 0
        var posY: Int = 0
    }
    
    // Get n Set for Damage
    private var _damage: Int = 0
    var damage: Int {
        get{
            print("GET \(_damage)") // Print apenas para checar se passou
            return _damage
        }
        set{
            print("SET \(newValue)") // Print apenas para checar se passou
            _damage = newValue
        }
        
    }
     /*
      *  METHODS
      */
    
    // Prints attack
    func doAttack() {
        print("doAttack")
    }
    
    // Prints damage and player weapon
    func receivePlayerAttack( hitPoints: Int, weapon: String) {
        print("hit point \(hitPoints) and weapon \(weapon)")
    }
    
    // Special Attack
    func doPowerStrike(PlayerX: Int, PlayerY: Int) -> Int {
        print("doPowerStrike")
        return 1000
    }
    
    func stopMove() {
        print("Stop Enemy move")
    }
    
    func startMove() {
        print("Start Enemy move")
    }
}