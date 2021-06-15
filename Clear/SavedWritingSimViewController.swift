//
//  SavedWritingSimViewController.swift
//  SAT Daily
//
//  Created by RB on 1/3/21.
//

import Firebase
import UIKit

class SavedWritingSimViewController: UIViewController {
    
    var db: Firestore!
    var actualquestionid = 0
    var control = 0
    
    @IBOutlet weak var bg: UILabel!
    
    @IBOutlet weak var optlabelA: UIButton!
    @IBOutlet weak var question: UITextView!
    @IBOutlet weak var optlabelB: UIButton!
    @IBOutlet weak var optlabelC: UIButton!
    @IBOutlet weak var optlabelD: UIButton!
    
    @IBOutlet weak var SwitchS: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        SwitchS.addTarget(self, action: #selector(buttonClicked), for: .valueChanged)
        
        // Enabling Button if Saved
        view.bringSubviewToFront(SwitchS)
        
        if let readingValue = UserDefaults.standard.array(forKey: "writingArray") as? [Int], readingValue.contains(actualquestionid) {
            SwitchS.setOn(true, animated: true)
        }
        
        bg.layer.cornerRadius = 30
        bg.layer.masksToBounds = true
        
        // The Mastermind
        getInfoAndSet()
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        var arrayMath = UserDefaults.standard.array(forKey: "writingArray") as! [Int]
        if SwitchS.isOn {
            arrayMath.append(actualquestionid)
            UserDefaults.standard.set(arrayMath, forKey: "writingArray")
            let alert = UIAlertController(title: "SAT Daily", message: "Question is now saved again.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Thank you!", style: .default, handler: nil))
            self.present(alert, animated: true)         }
        else
        {
            if let index = arrayMath.firstIndex(of: actualquestionid) {
                arrayMath.remove(at: index)
                UserDefaults.standard.set(arrayMath, forKey: "writingArray")
                let alert = UIAlertController(title: "SAT Daily", message: "Question is now unsaved. Next time you open up Library the question wont be there.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Thank you!", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
        }
    }
    
    @IBAction func optiona(_ sender: Any) {
        let dailyToday = String(actualquestionid)
        let docRef = db.collection("writing").document(dailyToday)
        docRef.getDocument{ (document, error) in
            if let document = document, document.exists {
                if ((document.get("answer") as! String) == "optiona") {
                    self.performSegue(withIdentifier: "toCW", sender: self)
                }
                else {
                    self.control = 1
                    self.performSegue(withIdentifier: "toIncorrect", sender: self)
                    self.control = 0
               }
            }
        }

    }
    
    @IBAction func optionb(_ sender: Any) {
        let dailyToday = String(actualquestionid)
        let docRef = db.collection("writing").document(dailyToday)
        docRef.getDocument{ (document, error) in
            if let document = document, document.exists {
                if ((document.get("answer") as! String) == "optionb") {
                    self.performSegue(withIdentifier: "toCW", sender: self)
                }
                else {
                    self.control = 1
                    self.performSegue(withIdentifier: "toIncorrect", sender: self)
                    self.control = 0
          }
            }
        }
    }
    
    @IBAction func optionc(_ sender: Any) {
        let dailyToday = String(actualquestionid)
        let docRef = db.collection("writing").document(dailyToday)
        docRef.getDocument{ (document, error) in
            if let document = document, document.exists {
                if ((document.get("answer") as! String) == "optionc") {
                    self.performSegue(withIdentifier: "toCW", sender: self)
                }
                else {
                    self.control = 1
                    self.performSegue(withIdentifier: "toIncorrect", sender: self)
                    self.control = 0
             }
            }
        }

    }
    
    @IBAction func optiond(_ sender: Any) {
        let dailyToday = String(actualquestionid)
        let docRef = db.collection("writing").document(dailyToday)
        docRef.getDocument{ (document, error) in
            if let document = document, document.exists {
                if ((document.get("answer") as! String) == "optiond") {
                    self.performSegue(withIdentifier: "toCW", sender: self)
                }
                else {
                    self.control = 1
                    self.performSegue(withIdentifier: "toIncorrect", sender: self)
                    self.control = 0
                }
            }
        }
    }
    
    private func getInfoAndSet()
    {
        let dailyToday = String(actualquestionid)
        let docRef = db.collection("writing").document(dailyToday)
        docRef.getDocument{ (document, error) in
            if let document = document, document.exists {
                
                // Question Code
                let question = document.get("question") as! String
                let firsthalf = document.get("firsthalf") as! String
                let secondhalf = document.get("secondhalf") as! String
                self.question.text = "\(firsthalf) [\(question)] \(secondhalf)\n\n What could replace the word in between the brackets []?\n"
                
                self.question.layer.cornerRadius = 30
                self.question.sizeToFit()
                self.question.isScrollEnabled = true
                self.question.clipsToBounds = true
                self.question.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
                self.question.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
                
                // Option A
                self.optlabelA.titleEdgeInsets = UIEdgeInsets(top: 20, left: 15, bottom: 20, right: 15)
                self.optlabelA.setTitle((document.get("optiona") as! String), for: .normal)
                self.optlabelA.titleLabel?.textAlignment = NSTextAlignment.center
                self.optlabelA.titleLabel?.numberOfLines = 3
                self.optlabelA.layer.cornerRadius = 30
                self.optlabelA.layer.shadowOffset = CGSize(width: 7, height: 7)
                self.optlabelA.layer.shadowRadius = 5
                self.optlabelA.layer.shadowOpacity = 1
                self.optlabelA.layer.shadowColor = CGColor(red: 0.5216, green: 0.6039, blue: 0.8588, alpha: 1)



                // Option B
                self.optlabelB.titleEdgeInsets = UIEdgeInsets(top: 20, left: 15, bottom: 20, right: 15)
                self.optlabelB.setTitle((document.get("optionb") as! String), for: .normal)
                self.optlabelB.titleLabel?.textAlignment = NSTextAlignment.center
                self.optlabelB.titleLabel?.numberOfLines = 3
                self.optlabelB.layer.cornerRadius = 30
                self.optlabelB.layer.shadowOffset = CGSize(width: 7, height: 7)
                self.optlabelB.layer.shadowRadius = 5
                self.optlabelB.layer.shadowOpacity = 1
                self.optlabelB.layer.shadowColor = CGColor(red: 0.5216, green: 0.6039, blue: 0.8588, alpha: 1)
                


                // Option C
                self.optlabelC.titleEdgeInsets = UIEdgeInsets(top: 20, left: 15, bottom: 20, right: 15)
                self.optlabelC.setTitle((document.get("optionc") as! String), for: .normal)
                self.optlabelC.titleLabel?.textAlignment = NSTextAlignment.center
                self.optlabelC.titleLabel?.numberOfLines = 3
                self.optlabelC.layer.cornerRadius = 30
                self.optlabelC.layer.shadowOffset = CGSize(width: 7, height: 7)
                self.optlabelC.layer.shadowRadius = 5
                self.optlabelC.layer.shadowOpacity = 1
                self.optlabelC.layer.shadowColor = CGColor(red: 0.5216, green: 0.6039, blue: 0.8588, alpha: 1)


                // Option D
                self.optlabelD.titleEdgeInsets = UIEdgeInsets(top: 20, left: 15, bottom: 20, right: 15)
                self.optlabelD.setTitle((document.get("optiond") as! String), for: .normal)
                self.optlabelD.titleLabel?.textAlignment = NSTextAlignment.center
                self.optlabelD.titleLabel?.numberOfLines = 3
                self.optlabelD.layer.cornerRadius = 30
                self.optlabelD.layer.shadowOffset = CGSize(width: 7, height: 7)
                self.optlabelD.layer.shadowRadius = 5
                self.optlabelD.layer.shadowOpacity = 1
                self.optlabelD.layer.shadowColor = CGColor(red: 0.5216, green: 0.6039, blue: 0.8588, alpha: 1)
                                
            } else {
                print("Document does not exist!")
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(control == 0){
            let vc = segue.destination as! WritingCorrectSimViewController
            vc.actualactualquestionid = self.actualquestionid
        }
    }

}
