//
//  WritingSimQuestionViewController.swift
//  SAT Daily
//
//  Created by RB on 2/23/21.
//

import SPAlert
import Firebase
import UIKit

class WritingSimQuestionViewController: UIViewController {

    @IBOutlet weak var optlabelA: UIButton!
    @IBOutlet weak var optlabelB: UIButton!
    @IBOutlet weak var optlabelC: UIButton!
    @IBOutlet weak var optlabelD: UIButton!
    @IBOutlet weak var save: UIButton!
    @IBOutlet weak var question: UITextView!
    
    var selected = "na"    
    var actualquestionid = 0
    var control = 0
    var articlecheck = 0
    
    var db: Firestore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()

        
        // Fill in the information
        getInfoAndSet()
        
    }

    // 1 means saved, 0 means not saved.
    @IBAction func saveButton(_ sender: Any) {
        if selected == "na" {
            SPAlert.present(title: "Please select an Answer Choice", preset: .error)
        }
        else
        {
            let dailyToday = String(actualquestionid)
            let docRef = db.collection("writing").document(dailyToday)
            docRef.getDocument{ (document, error) in
                if let document = document, document.exists {
                    if ((document.get("answer") as! String) == self.selected) {
                        
                        self.performSegue(withIdentifier: "toCorrect", sender: self)
                    }
                    else {
                        self.control = 1
                        self.performSegue(withIdentifier: "toIncorrect", sender: self)
                        self.control = 0
                    }
                }
            }
        }
    }
    
    @IBAction func optionA(_ sender: Any) {
        if optlabelA.isSelected == true {
            deselectall()
            selected = "na"
        } else {
            deselectall()
            optlabelA.isSelected = true
            optlabelA.backgroundColor = UIColor(red: 0.8196, green: 0.8196, blue: 0.8916, alpha: 1)
            selected = "optiona"
        }
    }
    @IBAction func optionB(_ sender: Any) {
        if optlabelB.isSelected == true {
            deselectall()
            selected = "na"
        } else {
            deselectall()
            optlabelB.isSelected = true
            optlabelB.backgroundColor = UIColor(red: 0.8196, green: 0.8196, blue: 0.8916, alpha: 1)
            selected = "optionb"
        }
    }
    @IBAction func optionC(_ sender: Any) {
        if optlabelC.isSelected == true {
            deselectall()
            selected = "na"
        } else {
            deselectall()
            optlabelC.isSelected = true
            optlabelC.backgroundColor = UIColor(red: 0.8196, green: 0.8196, blue: 0.8916, alpha: 1)
            selected = "optionc"
        }
    }
    @IBAction func optionD(_ sender: Any) {
        if optlabelD.isSelected == true {
            deselectall()
            selected = "na"
        } else {
            deselectall()
            optlabelD.isSelected = true
            optlabelD.backgroundColor = UIColor(red: 0.8196, green: 0.8196, blue: 0.8916, alpha: 1)
            selected = "optiond"
        }
    }
    

    func getInfoAndSet()
    {
        optlabelA.heightAnchor.constraint(equalToConstant: 60).isActive = true
        self.save.layer.cornerRadius = 10
        self.save.layer.shadowOffset = CGSize(width: 7, height: 7)
        self.save.layer.shadowRadius = 5
        self.save.layer.shadowOpacity = 1
        self.save.layer.shadowColor = CGColor(red: 0.5216, green: 0.6039, blue: 0.8588, alpha: 1)
        
        let dailyToday = String(actualquestionid)
        let docRef = db.collection("writing").document(dailyToday)
        docRef.getDocument{ (document, error) in
            if let document = document, document.exists {
                
                // Question Code
                let question = document.get("question") as! String
                let firsthalf = document.get("firsthalf") as! String
                let secondhalf = document.get("secondhalf") as! String
                self.question.text = "\(firsthalf) [\(question)] \(secondhalf)\n\n What could replace the phrase in between the brackets []?\n"
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
        if (control == 0)
        {
            let vc = segue.destination as! WritingCorrectSimViewController
            vc.actualactualquestionid = self.actualquestionid
        }
    }
    
    func deselectall()
    {
        optlabelA.backgroundColor = UIColor.white
        optlabelA.isSelected = false

        optlabelB.backgroundColor = UIColor.white
        optlabelB.isSelected = false

        optlabelC.backgroundColor = UIColor.white
        optlabelC.isSelected = false

        optlabelD.backgroundColor = UIColor.white
        optlabelD.isSelected = false

        selected = "na"
    }

}

