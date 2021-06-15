//
//  SavedReadingSimulationViewController.swift
//  SAT Daily
//
//  Created by RB on 1/1/21.
//

import SPAlert
import Firebase
import UIKit

class SavedReadingSimulationViewController: UIViewController {

    @IBOutlet weak var save: UIButton!
    @IBOutlet weak var passage: UITextView!
    
    var actualquestionid = 0
    var db: Firestore!
    var saveState = -1

    override func viewDidLoad() {
        super.viewDidLoad()
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        getInfoAndSet()
        
        self.save.layer.cornerRadius = 10
        self.save.layer.shadowOffset = CGSize(width: 7, height: 7)
        self.save.layer.shadowRadius = 5
        self.save.layer.shadowOpacity = 1
        self.save.layer.shadowColor = CGColor(red: 0.5216, green: 0.6039, blue: 0.8588, alpha: 1)
        
        // Set Button Text if Saved
        let intDailyToday: Int? = actualquestionid
        if let readingValue = UserDefaults.standard.array(forKey: "readingArray") as? [Int], readingValue.contains(intDailyToday!) {
            self.save.setTitle("Click to Unsave", for: .normal)
            saveState = 1
        }
        else
        {
            self.save.setTitle("Click to Save", for: .normal)
            saveState = 0
        }
    }
    //        let intDailyToday: Int? = actualquestionid

    @IBAction func saveClick(_ sender: Any) {
        let intDailyToday: Int? = actualquestionid
        var arrayReading = UserDefaults.standard.array(forKey: "readingArray") as! [Int]
        if saveState == 0 {
            arrayReading.append(intDailyToday!)
            UserDefaults.standard.set(arrayReading, forKey: "readingArray")
            SPAlert.present(title: "Passage Saved", preset: .done)
            self.save.setTitle("Click to Unsave", for: .normal)
            saveState = 1
        }
        else
        {
            if let index = arrayReading.firstIndex(of: intDailyToday!) {
                arrayReading.remove(at: index)
                UserDefaults.standard.set(arrayReading, forKey: "readingArray")
                SPAlert.present(title: "Passage Removed", preset: .done)
                self.save.setTitle("Click to Save", for: .normal)
                saveState = 0
            }
        }
    }
        
    func getInfoAndSet() {
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
}
