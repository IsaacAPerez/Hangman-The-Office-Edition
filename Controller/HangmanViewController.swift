//
//  HangmanViewController
//  Hangman
//
//  Created by iOS Decal on Feb 11 2020.
//  Copyright © 2020 iosdecal. All rights reserved.
//

import UIKit
import AVFoundation

class HangmanViewController: UIViewController {

    // MARK: - Instances: Models
    var musicPlayer = MusicPlayer()
    var ourGame = Hangman()
    let gameStatus = [UIImage(named: "Guess0"), UIImage(named: "Guess1-1"), UIImage(named: "Guess2-1"), UIImage(named: "Guess3-1"), UIImage(named: "Guess4-1"), UIImage(named: "Guess5-1"), UIImage(named: "Guess6-1")]
    
   // IBAction that switches to game screen
    @IBAction func pressed(_ sender: Any) {
        musicPlayer.audioPlayer?.stop()
        performSegue(withIdentifier: "GameSegue", sender: self)
    }
    
    // Custom viewDidLoad function that plays theme song
    override func viewDidLoad() {
        super.viewDidLoad()
        musicPlayer.startBackgroundMusic()
        
    }

    // Custome prepare function that passes neccesary information
    // to GameViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if let dest = segue.destination as? GameViewController {
            ourGame.randomize()
            dest.ourWord = ourGame.TheOffice[0]
            dest.ourChancesLeft = ourGame.incorrectGuesses
            dest.incorrectArray = ourGame.incorrectArray
            dest.gameStatePic = gameStatus as! [UIImage]}
    }
}
