//
//  GameScene.swift
//  HelloWorld
//
//  Created by Vntlab on 7/11/16.
//  Copyright (c) 2016 Vntlab. All rights reserved.
//
// bit.ly/29Lfsi9 -> Link de Swift pela Stanford

import SpriteKit

class GameScene: SKScene {
    
    /*
     *  Global Attributes
     */
    
    var score: Int = 0
    let xPosition = 400
    let yPosition = 300.50
    var hp = 100.10
    var gameOver = false
    var scoreText: String = "Score :"
    let weapon = ("shuriken", 100)
    let enemy: Enemy = Enemy()
    let enemy2: Enemy = Enemy(healthPoints: 400)
    var enemyList = Array<Enemy>() //Cria uma lista de objetos "Enemy"
    var armoredEnemy = ArmoredEnemy()
    var shoot = Shoot()
    
    /*
     *  Methods
     */
    

    override func didMoveToView(view: SKView) {
        
/*        // <> <> <> Primeira Aula <> <> <>
         
         let intHP = Int(hp)
         
        print("Position x \(xPosition)")
        print("Position y \(yPosition)")
        
        print("HP \(hp)")
        
        print("weapon description \(weapon.0) weapon damage \(weapon.1)")
        print("HP intger \(intHP)")
        
        print("Enemy Health \(enemy.healthPoints)")
        print("Enemy Health \(enemy2.healthPoints)")
        print("Enemy State \(enemy.enemyState)")
        enemy.doAttack()
        enemy.receivePlayerAttack(100, weapon: "sword")
        
        // Set and prints enemy damage
        enemy.damage = 200
        print("Enemy damage \(enemy.damage)")
        
        // Shows players damage
        let playerDamage = enemy.doPowerStrike(10,PlayerY: 10)
        print("player damage \(playerDamage)")
        
        // Colocando Objetos na lista
        enemyList.append(enemy)
        enemyList.append(enemy2)
        
        // Confirm Enemies in the List
        print("Enemy 1 health points \(enemyList[0].healthPoints)")
        print("Enemy 2 health points \(enemyList[1].healthPoints)")
        
        // <> <> <> Fim Primeira Aula <> <> <> */
        
        // <> <> <> Segunda Aula <> <> <>
        
//        // Remove first Enemy and confirms deletion
//        enemyList.removeAtIndex(0)
//        print("Enemy 1 health points \(enemyList[0].healthPoints)")
        
        // Sets enemy name and prints name
        enemy.name = "Zombie"
        print("Enemy name \(enemy.name)") // -> "Enemy name Optional (Zombie)"
        print("Enemy name \(enemy.name!)") // -> "Enemy name Zombie"
        
        //Herança
        armoredEnemy.doAttack()
        armoredEnemy.blastAttack()
        //Polimorfismo
        enemyList.append(armoredEnemy)
        enemyList.append(enemy)
        
        createEnemies(10)
        orderAllEnemiesToAttack()
        
        let moveable1: MoveProtocol = shoot
        let moveable2: MoveProtocol = enemy2
        
        moveable1.startMove()
        moveable2.startMove()
    
    }
    
    func createEnemies(quantity: Int) {
        
//        // Novo metodo de fazer FOR
//        for var i in 1...quantity {
//            enemyList.append(enemy)
//        }

        // Novo metodo de fazer FOR
        for _ in 1...quantity {
            enemyList.append(Enemy(healthPoints: 100))
        }
        enemyList.append(ArmoredEnemy())
    }
    
    func orderAllEnemiesToAttack() {
        for enemy in enemyList{
            
            if let storedEnemy = enemy as? ArmoredEnemy {
                storedEnemy.blastAttack()
            }else{
                enemy.doAttack()
            }
        }
    }
    
}
















