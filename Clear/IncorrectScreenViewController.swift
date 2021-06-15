//
//  IncorrectScreenViewController.swift
//  SAT Daily
//
//  Created by RB on 2/21/21.
//

import UIKit

class IncorrectScreenViewController: UIViewController {
    
    @IBOutlet weak var changeMessage: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let randomInt = Int.random(in: 1..<5)
        if randomInt == 1 {
            self.changeMessage.text = "Not quite... try again and make sure you read the question carefully!"
        }
        else if randomInt == 2 {
            self.changeMessage.text = "So close... if you are struggling with this question feel free to save it!"
        }
        else if randomInt == 3 {
            self.changeMessage.text = "You are almost there! Make sure you are clicking the right button as well!"
        }

    }
}
