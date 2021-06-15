//
//  SuggestedResourcesViewController.swift
//  SAT Daily
//
//  Created by RB on 2/28/21.
//

import Firebase
import UIKit

class SuggestedResourcesViewController: UIViewController {
    
    var db: Firestore!

    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        
        addStuff()

    }
    
    func addStuff()
    {
        let resourcemax = UserDefaults.standard.string(forKey: "resources")!
        let aor = Int(resourcemax) ?? 0
        stackView.axis = .vertical
        stackView.layer.cornerRadius = 30
        stackView.spacing = 30
        stackView.distribution = .fillEqually
        for resourceNumber in 1...aor {
          let button = UIButton()
            button.layer.masksToBounds = false
            button.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            var title = ""
            let docRef = db.collection("resources").document(String(resourceNumber))
            docRef.getDocument{ (document, error) in
                if let document = document, document.exists {
                    title = document.get("name") as! String
                    button.setTitle("\(title)", for: .normal)
                } else {
                    print("Document does not exist!")
                }
            }
                        
            button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .black)
            button.layer.backgroundColor = UIColor(hue: 0.6111, saturation: 0.25, brightness: 0.9, alpha: 1.0).cgColor
            button.layer.cornerRadius = 30
            button.layer.shadowOffset = CGSize(width: 5, height: 5)
            button.layer.shadowRadius = 20
            button.tag = resourceNumber
            button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
          stackView.addArrangedSubview(button)
        }
    }
    
    @objc public func buttonClicked(_ sender: UIButton) {
        var link = ""
        let docRef = db.collection("resources").document(String(sender.tag))
        docRef.getDocument{ (document, error) in
            if let document = document, document.exists {
                link = document.get("link") as! String
                if let url = URL(string: "\(link)") {
                    UIApplication.shared.open(url)
                }
            } else {
                    print("Document does not exist!")
                }
        }
    }
}
