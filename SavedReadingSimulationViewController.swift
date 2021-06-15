//
//  SavedReadingSimulationViewController.swift
//  SAT Daily
//
//  Created by RB on 1/1/21.
//

import Firebase
import UIKit

class SavedReadingSimulationViewController: UIViewController {

    
    var db: Firestore!
    
    @IBOutlet weak var bgSwitch: UILabel!
    @IBOutlet weak var SwitchS: UISwitch!
    @IBOutlet weak var SwitchLabel: UILabel!
    
    var actualquestionid = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        getInfoAndSet()
        SwitchS.addTarget(self, action: #selector(buttonClicked), for: .valueChanged)
        
        // Enabling Button if Passage is Saved
        let intDailyToday: Int? = actualquestionid
        if let readingValue = UserDefaults.standard.array(forKey: "readingArray") as? [Int], readingValue.contains(intDailyToday!) {
            SwitchS.setOn(true, animated: true)
        }
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        let intDailyToday: Int? = actualquestionid
        var arrayReading = UserDefaults.standard.array(forKey: "readingArray") as! [Int]
        if SwitchS.isOn {
            arrayReading.append(intDailyToday!)
            UserDefaults.standard.set(arrayReading, forKey: "readingArray")
            SwitchLabel.text = "Passage is Saved!"
        }
        else
        {
            if let index = arrayReading.firstIndex(of: intDailyToday!) {
                arrayReading.remove(at: index)
                UserDefaults.standard.set(arrayReading, forKey: "readingArray")
            }
            SwitchLabel.text = "Save this Passage?"
        }

    }
    

    @IBOutlet weak var displayPassage: UITextView!
    
    private func getInfoAndSet() {
        self.bgSwitch.layer.masksToBounds = true
        self.bgSwitch.layer.cornerRadius = 30
        
        let dailyToday = String(actualquestionid)
        let docRef = db.collection("passages").document(dailyToday)
        docRef.getDocument{ (document, error) in
            if let document = document, document.exists {
                let title = document.get("title") as! String
                let author = document.get("author") as! String
                let passage = document.get("passage") as! String
                self.displayPassage.contentInset = UIEdgeInsets(top: 20, left: 15, bottom: 20, right: 15)
                self.displayPassage.layer.cornerRadius = 30
                self.displayPassage.textAlignment = NSTextAlignment.center
                self.displayPassage.text = "\(title)\n by \(author) \n\n \(passage)"
            } else {
                print("Document does not exist!")
            }
        }

    }
}
