//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        //checking if selected answer is correct
        let userAnswer = sender.currentTitle! //True or False
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        //color of button changes depending on right or wrong answer selected
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        }
        else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        //creating a timer that is triggered after 2 secs, once that time is up a method inside selector is called
        //repeats: false -> we only need the timer to run once wait for .2 secs, call updateUI and thats it
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    
    }
    
    //updates the UI based on current question and give user feedback on answer
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        
        progressBar.progress = quizBrain.getProgress()
        
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        trueButton.backgroundColor = UIColor.clear
        
        falseButton.backgroundColor = UIColor.clear
        
    }


}

