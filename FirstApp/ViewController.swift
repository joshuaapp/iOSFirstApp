//
//  ViewController.swift
//  FirstApp
//
//  Created by Joshua Apperley on 22/07/16.
//  Copyright © 2016 JoshuaApperley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var firstCard: UIButton!
    @IBOutlet weak var secondCard: UIButton!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var enemyScoreLabel: UILabel!
    @IBOutlet weak var homeButton: UIButton!
    
    var playerScore = 0
    var enemyScore = 0
    var gameWon = false;
    
    let cardNames:[String] = ["card2", "card3", "card4","card5","card6","card7","card8","card9","card10","jack","queen","king","ace"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //additional setup
        //self.dealButton.setTitle("Deal Cards", forState: UIControlState.Normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cardPressed(_ sender: UIButton) {
        //Create random numbers to select cards
        if(!gameWon){
            let firstCardRandNum = Int(arc4random_uniform(13))
            let secondCardRandNum = Int(arc4random_uniform(13))
            
            if(sender.isEqual(self.firstCard)){
                transition(from: firstCard, too: cardNames[firstCardRandNum])
            }
            else if(sender.isEqual(self.secondCard)){
                transition(from: secondCard, too: cardNames[secondCardRandNum])
            }
            //compare two cards to determine winner
            if(firstCardRandNum > secondCardRandNum){
                self.playerScore += 1
                self.playerScoreLabel.text = String(playerScore)
            }
                
            else if(firstCardRandNum < secondCardRandNum){
                self.enemyScore += 1
                self.enemyScoreLabel.text = String(enemyScore)
            }
            else{
                //both cards are same value, therefore do nothing
            }
            
            //transition flip the enemy card
            if(sender.isEqual(firstCard)){
                transition(from: secondCard, too: cardNames[secondCardRandNum])
            }
            else if(sender.isEqual(secondCard)){
                transition(from: firstCard, too: cardNames[firstCardRandNum])

            }
            
            //transition(from: firstCard, too: "back")
            //transition(from: secondCard, too: "back")
            
        }
        checkGameWon();
    }
    
    func transition(from: UIButton, too: String){
        UIView.transition(with: from, duration: 1.0, options: .transitionFlipFromRight, animations: {
            from.setImage(UIImage(named: too), for: .normal)
            }, completion: nil)
    }
    func checkGameWon(){
        if(self.playerScore == 10 || self.enemyScore == 10){
            gameWon = true
            //reset scores
            self.playerScore=0
            self.enemyScore=0
        }
    }
    
}

