//
//  ViewController.swift
//  FirstApp
//
//  Created by Joshua Apperley on 22/07/16.
//  Copyright © 2016 JoshuaApperley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstCard: UIImageView!
    @IBOutlet weak var secondCard: UIImageView!
    @IBOutlet weak var dealButton: UIButton!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var enemyScoreLabel: UILabel!
    
    var playerScore = 0
    var enemyScore = 0
    
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
    
    @IBAction func dealAction(sender: AnyObject) {
        //Create random numbers to select cards
        let firstCardRandNum = Int(arc4random_uniform(13))
        let secondCardRandNum = Int(arc4random_uniform(13))

        //retireve appropriate cards from array using the generated random numbers
        self.firstCard.image = UIImage(named: cardNames[firstCardRandNum])
        self.secondCard.image = UIImage(named: cardNames[secondCardRandNum])
        
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
       
    }
    
}

