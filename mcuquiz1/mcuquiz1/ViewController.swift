//
//  ViewController.swift
//  mcuquiz1
//
//  Created by Spence on 7/24/18.
//  Copyright © 2018 Maya Narang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var questionPic: UIImageView!
    @IBOutlet weak var questionText: UILabel!
    
    @IBOutlet weak var question0: UIButton!
    @IBOutlet weak var question1: UIButton!
    @IBOutlet weak var question2: UIButton!
    @IBOutlet weak var question3: UIButton!
    
    @IBAction func subAnswer0(_ sender: UIButton) {
        checkAnswer(idx: 0)
    }
    @IBAction func subAnswer1(_ sender: UIButton) {
        checkAnswer(idx: 1)
    }
    @IBAction func subAnswer2(_ sender: UIButton) {
        checkAnswer(idx: 2)
    }
    @IBAction func subAnswer3(_ sender: UIButton) {
        checkAnswer(idx: 3)
    }
    
    struct Question {
        let question: String
        let answers: [String]
        let correctAnswer: Int
    }
    
    var questions: [Question] = [
        Question (
            question: "Which MCU movie is this Stan Lee cameo from?",
            answers: ["Black Panther", "Spider-man Homecoming", "Captain America: Civil War", "Iron Man 3"],
            correctAnswer: 1),
        Question (
            question: "What does S.H.I.E.L.D stand for?",
            answers: ["Society for Human Individual Enhancements and Language Division", "Secret Homeland Institution for Enhanced and Logistical Data", "Strategic Homeland Intervention Enforcement and Logistics Division", "Nothing, they just really wanted their initials to spell SHIELD."],
            correctAnswer: 2)
    ]
    
    var currentQuestion: Question?
    var currentQuestionPosition: Int = 0
    var numCorrect: Int = 0
    
    func setQuestion() {
        questionText.text = currentQuestion!.question
        question0.setTitle(currentQuestion!.answers[0], for: .normal)
        question1.setTitle(currentQuestion!.answers[1], for: .normal)
        question2.setTitle(currentQuestion!.answers[2], for: .normal)
        question3.setTitle(currentQuestion!.answers[3], for: .normal)
        progressLabel.text = "Question: \(currentQuestionPosition + 1)/ \(questions.count)"
    }
    
    func loadNextQuestion() {
        if currentQuestionPosition + 1 < questions.count {
            currentQuestionPosition += 1
            currentQuestion = questions[currentQuestionPosition]
            setQuestion()
        }
        else {
            performSegue(withIdentifier: "sgShowResults", sender: nil)
        }
    }
    
    func checkAnswer(idx: Int) {
        if idx == currentQuestion!.correctAnswer {
            numCorrect += 1
        }
        loadNextQuestion()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentQuestion = questions[0]
        setQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

