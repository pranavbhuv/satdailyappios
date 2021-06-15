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
    @IBOutlet weak var library: UIButton!
    @IBOutlet weak var other: UIButton!   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        
        graphics()
        backend()
    }
    
    @IBAction func today(_ sender: Any) {
        performSegue(withIdentifier: "toDailyChooser", sender: self)
    }
    
    @IBAction func past(_ sender: Any) {
        performSegue(withIdentifier: "toPastQuestions", sender: self)
    }
    
    @IBAction func library(_ sender: Any) {
        performSegue(withIdentifier: "toSavedChooser", sender: self)
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
            } else {
                print("Document does not exist!")
            }
        }
        
        // Saved Array for Reading Questions
        if let readingValue = UserDefaults.standard.array(forKey: "readingArray") { print(readingValue)
            print("Reading Array: Detected it does exist.")
        }
        else { UserDefaults.standard.set([Int](), forKey: "readingArray")
            var readingNums = UserDefaults.standard.array(forKey: "readingArray") as! [Int]
            UserDefaults.standard.set(readingNums, forKey: "readingArray")
            print(UserDefaults.standard.array(forKey: "readingArray") as Any)
            print("Reading Array: Detected it doesnt exist.")
        }
        
        // Saved array for Math Questions
        if let mathValue = UserDefaults.standard.array(forKey: "mathArray") {
            print(mathValue)
            print("Math Array: Detected it does exist.")
        }
        else { UserDefaults.standard.set([Int](), forKey: "mathArray")
            var mathNums = UserDefaults.standard.array(forKey: "mathArray") as! [Int]
            UserDefaults.standard.set(mathNums, forKey: "mathArray")
            print(UserDefaults.standard.array(forKey: "mathArray") as Any)
            print("Math Array: Detected it doesnt exist.")
        }
        
        // Saved array for Writing Questions
        if let writingValue = UserDefaults.standard.array(forKey: "writingArray") {
            print(writingValue)
            print("Writing Array: Detected it does exist.")
        }
        else { UserDefaults.standard.set([Int](), forKey: "writingArray")
            var writingNums = UserDefaults.standard.array(forKey: "writingArray") as! [Int]
            UserDefaults.standard.set(writingNums, forKey: "writingArray")
            print(UserDefaults.standard.array(forKey: "writingArray") as Any)
            print("Writing Array: Detected it doesnt exist.")
        }
    }
    
    func graphics()
    {
        let bg = UIImage(named: "homepageblank")
        var imageView: UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.clipsToBounds = true
        imageView.image = bg
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
        
        today.heightAnchor.constraint(equalToConstant: 70).isActive = true
        today.layer.backgroundColor = UIColor(hue: 0.6111, saturation: 0.25, brightness: 0.9, alpha: 1.0).cgColor
        today.layer.cornerRadius = 30
        
        past.heightAnchor.constraint(equalToConstant: 70).isActive = true
        past.layer.backgroundColor = UIColor(hue: 0.6111, saturation: 0.25, brightness: 0.9, alpha: 1.0).cgColor
        past.layer.cornerRadius = 30
        
        library.heightAnchor.constraint(equalToConstant: 70).isActive = true
        library.layer.backgroundColor = UIColor(hue: 0.6111, saturation: 0.25, brightness: 0.9, alpha: 1.0).cgColor
        library.layer.cornerRadius = 30
        
        other.heightAnchor.constraint(equalToConstant: 70).isActive = true
        other.layer.backgroundColor = UIColor(hue: 0.6111, saturation: 0.25, brightness: 0.9, alpha: 1.0).cgColor
        other.layer.cornerRadius = 30

    }

}
