//
//  MasterViewController.swift
//  WordScramble
//
//  Created by David Chin on 11/09/2016.
//  Copyright © 2016 Dakerr Consulting. All rights reserved.
//

import GameKit
import UIKit

class MasterViewController: UITableViewController {

    var objects = [String]()
    var allWords = [String]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Prompt the user for word
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(promptForAnswer))
        
        // Load the start.txt file
        if let startWordsPath = NSBundle.mainBundle().pathForResource("start", ofType: "txt") {
            if let startWords = try? String(contentsOfFile: startWordsPath, usedEncoding: nil) {
                allWords = startWords.componentsSeparatedByString("\n")
                
            } else {
                allWords = ["silkworm"]
            }
        }
        
        startGame()
    }
    
    func startGame() {
        allWords = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(allWords) as! [String]
        title = allWords[0]
        objects.removeAll(keepCapacity: true)
        tableView.reloadData()
    }
    
    func promptForAnswer() {
        let ac = UIAlertController(title: "Enter answer", message: nil, preferredStyle: .Alert)
        ac.addTextFieldWithConfigurationHandler(nil)
        
        // [unowned self, ac] declares self (the current view controller) and ac (our UIAlertController) to be captured as unowned references inside the closure. It means the closure can use them, but won't create a strong reference cycle because we've made it clear the closure doesn't own either of them.
        let submitAction = UIAlertAction(title: "Submit", style: .Default) { [unowned self, ac] (action: UIAlertAction!) in
            
            // force unwraps the array of text fields (it's optional because there might not be any; we can force unwrap because we know we added one), then tells Swift to treat it as a UITextField
            let answer = ac.textFields![0]
            
            // This submitAnswer() method is external to the closures current context, so when you're writing it you might not realise that calling submitAnswer() implicitly requires that self be captured by the closure. That is, the closure can't call submitAnswer() if it doesn't capture the view controller.
            // We've already declared that self is unowned by the closure, but Swift wants us to be absolutely sure we know what we're doing: every call to a method or property of the current view controller must prefixed with "self.", as in self.submitAnswer().
            // In project 1, I told you there were two trains of thought regarding use of self, and said, "The first group of people never like to use self. unless it's required, because when it's required it's actually important and meaningful, so using it in places where it isn't required can confuse matters."
            // Implicit capture of self in closures is that place when using self is required and meaningful: Swift won't let you avoid it here. By restricting your use of self to closures, you can easily check your code doesn't have any reference cycles by searching for "self" – there ought not to be too many to look through!
            self.submitAnswer(answer.text!)
        }
        
        ac.addAction(submitAction)
        presentViewController(ac, animated: true, completion: nil)
    }
    
    func submitAnswer(answer: String) {
        let lowerAnswer = answer.lowercaseString

        // (1) This method needs to check whether the player's word can be made from the given letters.
        if wordIsPossible(lowerAnswer) {

            // (2) It needs to check whether the word has been used already, because obviously we don't want duplicate words.
            if wordIsOriginal(lowerAnswer) {

                // (3) It also needs to check whether the word is actually a valid English word, because otherwise the user can just type in nonsense.
                if wordIsReal(lowerAnswer) {
        
                    // If checks pass:
                    // (1) Add the word to the objects array, then
                    objects.insert(lowerAnswer, atIndex: 0)

                    // (2) Insert a new row in the table view. We could just use the table view's reloadData() method to force a full reload, but that's not very efficient when we're changing just one row. Also, we'll use insertRowsAtIndexPaths instead of reload() in order for animation of the newly-inserted row.
                    let indexPath = NSIndexPath(forRow: 0, inSection: 0)
                    tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
                }
            }
        }
    }
    
    func wordIsPossible(word: String) -> Bool {
        var tempWord = title?.lowercaseString
        
        for letter in word.characters {
            if let pos = tempWord?.rangeOfString(String(letter)) {
                tempWord?.removeAtIndex(pos.startIndex)
            } else {
                return false
            }
        }

        return true
    }
    
    func wordIsOriginal(word: String) -> Bool {
        return !objects.contains(word)
    }
    
    func wordIsReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSMakeRange(0, word.characters.count)
        let misspelledRange = checker.rangeOfMisspelledWordInString(word, range: range, startingAt: 0, wrap: false, language: "en")
        
        if misspelledRange.location == NSNotFound {
            return true
        } else {
            return false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        let object = objects[indexPath.row]
        cell.textLabel!.text = object
        return cell
    }


}

