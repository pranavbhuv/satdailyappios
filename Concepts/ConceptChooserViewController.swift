//
//  ConceptChooserViewController.swift
//  SAT Daily
//
//  Created by RB on 3/14/21.
//

import SPAlert
import Firebase
import UIKit


class ConceptChooserViewController: UIViewController {

    
    @IBOutlet weak var todays: UILabel!
    @IBOutlet weak var reading: UIButton!
    @IBOutlet weak var writing: UIButton!
    @IBOutlet weak var math: UIButton!
    
    var db: Firestore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        
        
        let bg = UIImage(named: "savedpage")
        // let bg = UIImage(named: "selections")
        var imageView: UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.clipsToBounds = true
        imageView.image = bg
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)

        todays.adjustsFontSizeToFitWidth = true
        todays.minimumScaleFactor = 0.2
        todays.numberOfLines = 0
        todays.layer.cornerRadius = 10
        todays.layer.masksToBounds = true
        
        reading.heightAnchor.constraint(equalToConstant: 70).isActive = true
        reading.layer.backgroundColor = UIColor(hue: 0.5611, saturation: 0.4, brightness: 0.74, alpha: 1.0).cgColor
        reading.layer.cornerRadius = 30
        
        writing.heightAnchor.constraint(equalToConstant: 70).isActive = true
        writing.layer.backgroundColor = UIColor(hue: 0.5611, saturation: 0.4, brightness: 0.74, alpha: 1.0).cgColor
        writing.layer.cornerRadius = 30
        
        math.heightAnchor.constraint(equalToConstant: 70).isActive = true
        math.layer.backgroundColor = UIColor(hue: 0.5611, saturation: 0.4, brightness: 0.74, alpha: 1.0).cgColor
        math.layer.cornerRadius = 30
        

        
        assignmsg()
    }
    
    
    @IBAction func toReading(_ sender: Any) {
        performSegue(withIdentifier: "toReadingConcepts", sender: self)
    }
    @IBAction func toWriting(_ sender: Any) {
        performSegue(withIdentifier: "toWritingConcepts", sender: self)
    }
    @IBAction func toMath(_ sender: Any) {
        performSegue(withIdentifier: "toMathConcepts", sender: self)
    }
    
    func assignmsg()
    {
        let docRef = db.collection("dailyids").document("daily")
        docRef.getDocument{ (document, error) in
            if let document = document, document.exists {
                let msg = document.get("weeklymsg") as! String
                SPAlert.present(title: msg, preset: .heart)
            } else {
                print("Document does not exist!")
            }
        }

    }
}
