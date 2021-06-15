//
//  SavedReadingSimulationViewController.swift
//  SAT Daily
//
//  Created by RB on 1/1/21.
//

import Firebase
import UIKit

class SavedReadingSimulationViewController: UIViewController {

    @IBOutlet weak var save: UIButton!
    @IBOutlet weak var passage: UITextView!
    
    var articlecheck = 0
    var actualquestionid = 0
    var db: Firestore!

    override func viewDidLoad() {
        super.viewDidLoad()
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        
        if articlecheck == 0
        {
            getInfoAndSetReading()
        }
        else if articlecheck == 1
        {
            getInfoAndSetReadingConcept()
        }
        else if articlecheck == 2
        {
            getInfoAndSetWritingConcept()
        }
        else if articlecheck == 3
        {
            getInfoAndSetMathConcept()
        }
        else
        {
            print("Something broke.")
        }
    }
        
    func getInfoAndSetReading() {
        let dailyToday = String(actualquestionid)
        let docRef = db.collection("passages").document(dailyToday)
        docRef.getDocument{ (document, error) in
            if let document = document, document.exists {
                let title = document.get("title") as! String
                let author = document.get("author") as! String
                let passage = document.get("passage") as! String
                self.passage.contentInset = UIEdgeInsets(top: 20, left: 15, bottom: 20, right: 15)
                self.passage.layer.cornerRadius = 30
                self.passage.textAlignment = NSTextAlignment.center
                self.passage.text = "\(title)\n by \(author) \n\n \(passage)"
            } else {
                print("Document does not exist!")
            }
        }
    }
    
    func getInfoAndSetReadingConcept()
    {
        let dailyToday = String(actualquestionid)
        let docRef = db.collection("readingconcepts").document(dailyToday)
        docRef.getDocument{ (document, error) in
            if let document = document, document.exists {
                let title = document.get("title") as! String
                let author = document.get("author") as! String
                let passage = document.get("content") as! String
                self.passage.contentInset = UIEdgeInsets(top: 20, left: 15, bottom: 20, right: 15)
                self.passage.layer.cornerRadius = 30
                self.passage.textAlignment = NSTextAlignment.center
                self.passage.text = "\(title)\n by \(author) \n\n \(passage)"
            } else {
                print("Document does not exist!")
            }
        }
        articlecheck = 0
    }
    
    func getInfoAndSetWritingConcept()
    {
        let dailyToday = String(actualquestionid)
        let docRef = db.collection("writingconcepts").document(dailyToday)
        docRef.getDocument{ (document, error) in
            if let document = document, document.exists {
                let title = document.get("title") as! String
                let author = document.get("author") as! String
                let passage = document.get("content") as! String
                self.passage.contentInset = UIEdgeInsets(top: 20, left: 15, bottom: 20, right: 15)
                self.passage.layer.cornerRadius = 30
                self.passage.textAlignment = NSTextAlignment.center
                self.passage.text = "\(title)\n by \(author) \n\n \(passage)"
            } else {
                print("Document does not exist!")
            }
        }
        articlecheck = 0
    }
    
    func getInfoAndSetMathConcept()
    {
        let dailyToday = String(actualquestionid)
        let docRef = db.collection("mathconcepts").document(dailyToday)
        docRef.getDocument{ (document, error) in
            if let document = document, document.exists {
                let title = document.get("title") as! String
                let author = document.get("author") as! String
                let passage = document.get("content") as! String
                self.passage.contentInset = UIEdgeInsets(top: 20, left: 15, bottom: 20, right: 15)
                self.passage.layer.cornerRadius = 30
                self.passage.textAlignment = NSTextAlignment.center
                self.passage.text = "\(title)\n by \(author) \n\n \(passage)"
            } else {
                print("Document does not exist!")
            }
        }
        articlecheck = 0
    }
}
