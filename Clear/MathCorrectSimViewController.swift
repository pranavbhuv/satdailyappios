//
//  MathCorrectSimViewController.swift
//  SAT Daily
//
//  Created by RB on 1/3/21.
//

import Firebase
import UIKit

class MathCorrectSimViewController: UIViewController {
    
    var db: Firestore!
    var actualactualquestionid = 0

    @IBOutlet weak var congrats: UILabel!
    @IBOutlet weak var explanation: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        doStuff()
    }
    
    public func doStuff()
    {
        let dailyToday = String(actualactualquestionid)
        let docRef = db.collection("math").document(dailyToday)
        docRef.getDocument{ (document, error) in
            if let document = document, document.exists {
                // Explanation Code
                let explanation = document.get("explanation")
                let explanationDisplay = explanation as! String
                self.explanation.text = explanationDisplay
            }
        }
        self.congrats.adjustsFontSizeToFitWidth = true
        let randomInt = Int.random(in: 1..<4)
        if randomInt == 1 {
            self.congrats.text = "Well done!"
        }
        else if randomInt == 2 {
            self.congrats.text = "Congrats!"
        }
        else if randomInt == 3 {
            self.congrats.text = "Awesome!"
        }
    }

    
    
    


}
