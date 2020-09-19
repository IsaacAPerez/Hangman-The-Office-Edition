//
//  Hangman.swift
//  Hangman
//
//  Created by Isaac Perez on 2/20/20.
//  Copyright © 2020 Tim's Apples. All rights reserved.
//

import Foundation

class Hangman {
    
    // My Word Bank
    var TheOffice:[String] = [
        "Michael Scott",
        "Dwight Schrute",
        "Jim Halpert",
        "Pam Beesly",
        "Ryan Howard",
        "Andy Bernard",
        "Robert California",
        "Stanley Hudson",
        "Kevin Malone",
        "Meredith Palmer",
        "Angela Martin",
        "Oscar Martinez",
        "Phyllis Lapin",
        "Roy Anderson",
        "Toby Flenderson",
        "Jan Levinson",
        "Creed Bratton",
        "Darryl Philbin",
        "Erin Hannon",
        "Gabe Lewis",
        "Holly Flax",
        "Nellie Bertram",
        "Pete Miller",
        "Clark Green",
        "Jan Levinson",
        "Creed Bratton",
        "Darryl Philbin",
        "Erin Hannon",
        "David Wallace"    ]
    
    // 6 Body Parts in Game, So only 6 chances
    let incorrectGuesses = 6
    
    // Shuffles the order of our word bank
    func randomize() {
        TheOffice = TheOffice.shuffled()
    }
    // Array that holds incorrect letters
    var incorrectArray = [String]()
    
}

