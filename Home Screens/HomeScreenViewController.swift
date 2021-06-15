//
//  HomeScreenViewController.swift
//  SAT Daily
//
//  Created by RB on 2/27/21.
//

import Firebase
import UIKit

class HomeScreenViewController: UIViewController {
    
    var db: Firestore!

    @IBOutlet weak var today: UIButton!
    @IBOutlet weak var past: UIButton!
    @IBOutlet weak var resources: UIButton!
    @IBOutlet weak var profile: UIButton!
    @IBOutlet weak var other: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
                
        graphics()
        backend()
    }
        
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        username()
    }
        
    @IBAction func today(_ sender: Any) {
        performSegue(withIdentifier: "toDailyChooser", sender: self)
    }
    
    @IBAction func past(_ sender: Any) {
        performSegue(withIdentifier: "toPastQuestions", sender: self)
    }
    
    @IBAction func resources(_ sender: Any) {
        performSegue(withIdentifier: "toConcepts", sender: self)
    }
    
    @IBAction func profile(_ sender: Any) {
        performSegue(withIdentifier: "toProfile", sender: self)
    }
    
    @IBAction func other(_ sender: Any) {
        performSegue(withIdentifier: "toOther", sender: self)
    }
    
    
    func backend()
    {
        // Daily Question IDs
        let defaults = UserDefaults.standard
        let docRef = db.collection("dailyids").document("daily")
        docRef.getDocument{ (document, error) in
            if let document = document, document.exists {
                let reading = document.get("reading") as! String
                defaults.set(reading, forKey: "reading")
                let writing = document.get("writing") as! String
                defaults.set(writing, forKey: "writing")
                let math = document.get("math") as! String
                defaults.set(math, forKey: "math")
                let resources = document.get("resources") as! String
                defaults.set(resources, forKey: "resources")
                let month = document.get("monthno") as! String
                defaults.set(month, forKey: "monthno")
                let readingconceptmax = document.get("readingconceptmax") as! String
                defaults.set(readingconceptmax, forKey: "readingconceptmax")
                let mathconceptmax = document.get("mathconceptmax") as! String
                defaults.set(mathconceptmax, forKey: "mathconceptmax")
                let writingconceptmax = document.get("writingconceptmax") as! String
                defaults.set(writingconceptmax, forKey: "writingconceptmax")
            } else {
                print("Document does not exist!")
            }
        }
        
        // Create User Information
        if let uuid = UserDefaults.standard.string(forKey: "uuid")
        {
            print("UUID: \(uuid)")
        }
        else {
            let uuid = randomString(length: 21)
            UserDefaults.standard.setValue(uuid, forKey: "uuid")
            print("Created UUID: \(uuid)")
        }
        
        // Create User Correct Question's Answered
        if let qans = UserDefaults.standard.string(forKey: "qans")
        {
            print("Correct Q's Answered: \(qans)")
        }
        else {
            UserDefaults.standard.setValue("0", forKey: "qans")
            print("Created Correct User Questions")
        }
        
        // Create User Incorrect Question's Answered
        if let iqans = UserDefaults.standard.string(forKey: "iqans")
        {
            print("Incorrect Q's Answered: \(iqans)")
        }
        else {
            UserDefaults.standard.setValue("1", forKey: "iqans")
            print("Created Incorrect User Questions")
        }

    }
    
    func username() {
        if let username = UserDefaults.standard.string(forKey: "username")
        {
            print("Username: \(username)")
        }
        else
        {
            let alert = UIAlertController(title: "What should we call you? 🤔", message: "", preferredStyle: .alert)
            alert.addTextField() {
                (textfield) in textfield.autocorrectionType = .yes
                textfield.keyboardAppearance = .default
            }
            let submitAction = UIAlertAction(title: "Submit", style: .default) {
                [unowned alert] _ in
                let answer = ((alert.textFields![0] as UITextField).text) ?? "Nameless"
                UserDefaults.standard.setValue(answer, forKey: "username")
            }
            alert.addAction(submitAction)
            present(alert, animated: true)
            
            // Create a document with username+UUID and store name in there.
        }
    }
    
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuzwxyzABCDEFGHIJKLMNOPQRSTUVWQYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    func graphics()
    {
        let bg = UIImage(named: "backgroundlmao")
        var imageView: UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.clipsToBounds = true
        imageView.image = bg
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
        
        today.heightAnchor.constraint(equalToConstant: 70).isActive = true
        today.layer.backgroundColor = UIColor(hue: 0.5611, saturation: 0.4, brightness: 0.74, alpha: 1.0).cgColor
        today.layer.cornerRadius = 30
        
        past.heightAnchor.constraint(equalToConstant: 70).isActive = true
        past.layer.backgroundColor = UIColor(hue: 0.5611, saturation: 0.4, brightness: 0.74, alpha: 1.0).cgColor
        past.layer.cornerRadius = 30
        
        resources.heightAnchor.constraint(equalToConstant: 70).isActive = true
        resources.layer.backgroundColor = UIColor(hue: 0.5611, saturation: 0.4, brightness: 0.74, alpha: 1.0).cgColor
        resources.layer.cornerRadius = 30
        
        profile.heightAnchor.constraint(equalToConstant: 70).isActive = true
        profile.layer.backgroundColor = UIColor(hue: 0.5611, saturation: 0.4, brightness: 0.74, alpha: 1.0).cgColor
        profile.layer.cornerRadius = 30
        
        other.heightAnchor.constraint(equalToConstant: 70).isActive = true
        other.layer.backgroundColor = UIColor(hue: 0.5611, saturation: 0.4, brightness: 0.74, alpha: 1.0).cgColor
        other.layer.cornerRadius = 30

    }

}
