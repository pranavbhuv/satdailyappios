//
//  OtherScreenViewController.swift
//  SAT Daily
//
//  Created by RB on 2/21/21.
//

import Firebase
import UIKit

class OtherScreenViewController: UIViewController {

    @IBOutlet weak var other: UILabel!
    
    @IBOutlet weak var discord: UIButton!
    @IBOutlet weak var credits: UIButton!
    @IBOutlet weak var feedback: UIButton!
    @IBOutlet weak var partner: UIButton!
    
    var db: Firestore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bg = UIImage(named: "othermaybe")
        var imageView: UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.clipsToBounds = true
        imageView.image = bg
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
        
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        
        discord.heightAnchor.constraint(equalToConstant: 75).isActive = true
        credits.heightAnchor.constraint(equalToConstant: 75).isActive = true
        feedback.heightAnchor.constraint(equalToConstant: 75).isActive = true
        partner.heightAnchor.constraint(equalToConstant: 75).isActive = true

        other.layer.cornerRadius = 10
        other.layer.masksToBounds = true
        discord.layer.cornerRadius = 20
        credits.layer.cornerRadius = 20
        feedback.layer.cornerRadius = 20
        partner.layer.cornerRadius = 20
    }

    @IBAction func discordButton(_ sender: Any) {
        if let url = URL(string: "https://discord.gg/gUq6rAyRrE") {
        UIApplication.shared.open(url)
        }
    }
    
    @IBAction func toCredits(_ sender: Any) {
        performSegue(withIdentifier: "toCredits", sender: self)
    }
    
    @IBAction func feedback(_ sender: Any) {
        let alert = UIAlertController(title: "Submit Feedback", message: "Have suggestions or want to report a bug? This is the place to do so!", preferredStyle: .alert)
        alert.addTextField() {
            (textfield) in textfield.autocorrectionType = .yes
            textfield.keyboardAppearance = .default
        }
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) {
            [unowned alert] _ in
            let answer = ((alert.textFields![0] as UITextField).text) ?? "None"
            self.db.collection("feedback").document("\(self.randomString(length: 10))").setData([
                "feedback": "\(String(describing: answer))"
            ])
        }
        alert.addAction(submitAction)
        present(alert, animated: true)
    }
    
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuzwxyzABCDEFGHIJKLMNOPQRSTUVWQYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    @IBAction func partners(_ sender: Any) {
        performSegue(withIdentifier: "toResources", sender: self)
    }
    
}
