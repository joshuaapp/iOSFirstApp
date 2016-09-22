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
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var popUpMessage: UITextField!
    
    var playerScore = 0
    var enemyScore = 0
    var gameWon = false
    let winningScore = 5
    
    let cardNames:[String] = ["card2", "card3", "card4","card5","card6","card7","card8","card9","card10","jack","queen","king","ace"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.popUpView.isHidden = true
        self.popUpView.layer.cornerRadius = 5
        self.popUpView.layer.shadowOpacity = 0.8
        self.popUpView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        //additional setup
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
            //if the player has selected the first card then decide whether it is higher or not
            //and issue a point accordingly
            if(sender.isEqual(self.firstCard)){
                transition(from: firstCard, too: cardNames[firstCardRandNum])
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
                }            }
                
                //if player picks card2
            else if(sender.isEqual(self.secondCard)){
                transition(from: secondCard, too: cardNames[secondCardRandNum])
                //compare two cards to determine winner
                if(firstCardRandNum > secondCardRandNum){
                    self.enemyScore += 1
                    self.enemyScoreLabel.text = String(enemyScore)
                }
                else if(firstCardRandNum < secondCardRandNum){
                    self.playerScore += 1
                    self.playerScoreLabel.text = String(playerScore)
                }
                else{
                    //both cards are same value, therefore do nothing
                }
            }
            //transition flip the enemy card
            if(sender.isEqual(firstCard)){
                transition(from: secondCard, too: cardNames[secondCardRandNum])
            }
            else if(sender.isEqual(secondCard)){
                transition(from: firstCard, too: cardNames[firstCardRandNum])
                
            }
        }
        checkGameWon();
    }
    
    func transition(from: UIButton, too: String){
        UIView.transition(with: from, duration: 1.0, options: .transitionFlipFromRight, animations: {
            from.setImage(UIImage(named: too), for: .normal)
            }, completion: nil)
    }
    
    func checkGameWon(){
        if(self.playerScore == winningScore || self.enemyScore == winningScore){
            gameWon = true
            if(self.playerScore == winningScore){
                showPopup(self.popUpView, withMessage: "You have won!", animated: true)
            }
            else if(self.enemyScore == winningScore){
                showPopup(self.popUpView, withMessage: "Oh no, you have lost!", animated: true)
            }
        }
    }
    
    /**Functions for winning/losing popup box**/
    open func showPopup(_ aView: UIView!, withMessage message: String!, animated: Bool)
    {
        aView.isHidden = false
        popUpMessage!.text = message
        if animated
        {
            self.showAnimate()
        }
    }
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    @IBAction open func closePopup(_ sender: AnyObject) {
        self.popUpView.isHidden = true
        //reset scores
        self.playerScore=0
        self.enemyScore=0
        //update text
        self.enemyScoreLabel.text = String(enemyScore)
        self.playerScoreLabel.text = String(playerScore)
        //reset cards
        transition(from: firstCard, too: "back")
        transition(from: secondCard, too: "back")
    }
    
}

