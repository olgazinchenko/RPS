//
//  ViewController.swift
//  RPS
//
//  Created by Olga on 30.04.2020.
//  Copyright © 2020 Olga. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var appSignTopLabel: UILabel!
    @IBOutlet weak var gameStatusLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet var gameView: UIView!
    
    var playerSign: Sign = .none
    
    @IBAction func rockButton(_ sender: UIButton) {
        playerSign = .rock
        play()
        updateUIAccordingStatus(sign: playerSign)
    }
    @IBAction func scissorsButton(_ sender: UIButton) {
        playerSign = .scissors
        play()
        updateUIAccordingStatus(sign: playerSign)
    }
    
    @IBAction func paperButton(_ sender: UIButton) {
        playerSign = .paper
        play()
        updateUIAccordingStatus(sign: playerSign)
    }
    
    @IBAction func playAgainButton(_ sender: UIButton) {
        playAgain()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        playAgain()
    }
    
    func updateUIAccordingStatus(sign: Sign) {
        if sign == .rock {
            paperButton.isHidden = true
            scissorsButton.isHidden = true
            rockButton.isEnabled = false
        } else if sign == .scissors {
            rockButton.isHidden = true
            paperButton.isHidden = true
            scissorsButton.isEnabled = false
        } else {
            rockButton.isHidden = true
            scissorsButton.isHidden = true
            paperButton.isEnabled = false
        }
    }

    func play(){
        let random = randomSign()
        let playResult = playerSign.gameStateDetermination(computerSign: random)
        gameStatusLabel.text = playResult.gameResult
        appSignTopLabel.text = random.emoji
        playAgainButton.isHidden = false
        scissorsButton.isEnabled = false
        paperButton.isEnabled = false
        rockButton.isEnabled = false
        if playResult == .draw {
            gameView.backgroundColor = UIColor(displayP3Red: 12, green: 12, blue: 12, alpha: 0.75)
        } else if playResult == .lose {
            gameView.backgroundColor = UIColor(displayP3Red: 255, green: 0, blue: 0, alpha: 0.9)
        } else if playResult == .win {
            gameView.backgroundColor = UIColor(displayP3Red: 0, green: 255, blue: 0, alpha: 0.9)
        }
    }
    
    func playAgain() {
        playerSign = .none
        playAgainButton.isHidden = true
        appSignTopLabel.text = "🤖"
        scissorsButton.isEnabled = true
        paperButton.isEnabled = true
        rockButton.isEnabled = true
        scissorsButton.isHidden = false
        paperButton.isHidden = false
        rockButton.isHidden = false
        gameView.backgroundColor = .cyan
        gameStatusLabel.text = GameState.start.gameResult
    }
}
