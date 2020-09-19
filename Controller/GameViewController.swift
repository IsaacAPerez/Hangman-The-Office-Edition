//
//  GameViewController.swift
//  Hangman
//
//  Created by Isaac Abel Perez on 3/5/20.
//  Copyright © 2020 Tim's Apples. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    // Initalizers
    var ourWord = ""
    var ourChancesLeft = 0
    var incorrectArray = [String]()
    var gameStatePic = [UIImage]()
    var guessCounter = 0
    var GameOver = false
    
    // IBOutlets
    @IBOutlet weak var CorrectGuesses: UILabel!
    @IBOutlet weak var TextField: UITextField!
    @IBOutlet weak var IncorrectGuesses: UILabel!
    @IBOutlet weak var GameState: UIImageView!
    
    // Custom viewDidLoad function
    override func viewDidLoad() {
        super.viewDidLoad()
        self.TextField.becomeFirstResponder()
        wordChoice()
        gameState()
        TextField.keyboardAppearance = .dark
    }
    
    // Initalize our hidden word from Hangman.TheOffice
    func wordChoice () {
        print(ourWord)
        var count = 0
        let array = Array(ourWord)
        for x in ourWord {
            if (x == " ") {
                CorrectGuesses.text! += "    "}
            if (count != array.count - 1){
                CorrectGuesses.text! += "_ "}
            else{
                CorrectGuesses.text! += "_"}
            count += 1
        }
        CorrectGuesses.text?.removeLast()
        CorrectGuesses.text?.removeLast()
    }
    
    // Updates Hangman state picture
    func gameState() {
        GameState.image = gameStatePic[guessCounter]
        guessCounter += 1
    }
    
    // IBAction for guess button. At a high level, this function
    // check the letter entered by the user to see if it is in chosen word
    @IBAction func Guess(_ sender: Any) {
        var counter = 0
        var changed = 0
        let picked = stringToChar(TextField.text!)
        let arrayword = stringToArray(ourWord)
        let input = TextField.text!.count
        
        if input > 1 {
            showInputError()}
        else if GameOver {
            showWinnerGameAlert()}
        else if ourChancesLeft < 1 {
            showEndGameAlert()}
        else if checkIncorrectArray(TextField.text!) == true {
            showIncorrectAlert()
            TextField.text = ""}
        else {
            for x in arrayword {
                if (x == picked) {
                    CorrectGuesses.text! =
                    replace(CorrectGuesses.text!,counter, picked)
                    changed += 1
                }
                counter += 1
            }
            if (changed == 0) {
                addIncorrectGuess()}
        }
        checkIfWon()
        TextField.text = ""
    }
    // Converts a single string into a Char
    func stringToChar(_ string: String) -> Character {
        var char: Character = " "
        for x in string {
            char = x    }
        return char
    }
    
    
    // Replaces the correct text field with chosen word at certain index
    func replace(_ string: String, _ index: Int, _ newChar: Character) -> String {
        var chars = Array(string)
        chars[index] = newChar
        let modifiedString = String(chars)
        return modifiedString
    }
    
    // Converts a string into an Array with some some tweaks, like spacing
    func stringToArray(_ string: String) -> Array<Character> {
        var array = [Character]()
        var counter = 0
        var arraystring = Array(string)
        arraystring.append(" ")
       
        for x in string {
            array.append(x)
            if (x == " ") {
                array.append(x)
                array.append(x)
                array.append(x)
                array.append(x)
            }
            if (arraystring[counter + 1] != " ") {
                if (x != " "){
                    array.append(" ")}
            }
            counter += 1
        }
        arraystring.remove(at: arraystring.count - 1)
        return array
    }
    
    // Checks if user selected same incorrect letter again
    func checkIncorrectArray(_ string: String) -> Bool {
        for x in incorrectArray {
            if string == x  {
                return true }
        }
        return false
    }
    
    // Alerts user to select another letter
    func showIncorrectAlert() {
        let alertController =
            UIAlertController(title: "Try Again!", message:
            "You already tried that letter!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
    
    // Alerts user that they lost the game
    func showEndGameAlert() {
        let alertController =
            UIAlertController(title: "You Lost Already!", message:
            "Press restart to try again", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
    
    // Alerts user that they won the game
    func showWinnerGameAlert() {
        let alertController =
            UIAlertController(title: "You Won!", message:
            "You are offically an Office Fan", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Press restart to try again!", style: .default))
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    // Adds incorrect guess to incorrect array and also checks
    // if they lost the game as well
    func addIncorrectGuess() {
        ourChancesLeft -= 1
        if ourChancesLeft < 1 {
            let alertController =
                UIAlertController(title: "GameOver!", message:
                "You're not a real Office Fan!", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }
        gameState()
        IncorrectGuesses.text?.append(TextField.text! + "  ")
        incorrectArray.append(TextField.text!)
    }
    
    // Restarts the game
    @IBAction func Restart(_ sender: Any) {
        performSegue(withIdentifier: "StartSegue", sender: self)
    }
    
    // Checks if the user won the game
    func checkIfWon() {
        var winningCounter = 0
        for x in CorrectGuesses.text! {
            if x == "_" {
                winningCounter += 1}
        }
        if winningCounter == 0 {
            GameOver = true
            showWinnerGameAlert()}
    }
    
    // Alerts the user if they input more than one character at once
    func showInputError() {
        let alertController =
            UIAlertController(title: "Incorrect choice!", message:
            "You can only choose one letter at a time!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Press restart to try again!", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
}
    
