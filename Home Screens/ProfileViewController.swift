//
//  ProfileViewController.swift
//  SAT Daily
//
//  Created by RB on 3/7/21.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var uuid: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textView.layer.cornerRadius = 30
        self.textView.sizeToFit()
        self.textView.isScrollEnabled = true
        self.textView.clipsToBounds = true
        self.textView.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        self.textView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        self.uuid.layer.cornerRadius = 30
        self.uuid.sizeToFit()
        self.uuid.clipsToBounds = true
        self.uuid.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        
        let uuid = UserDefaults.standard.string(forKey: "uuid")!
        self.uuid.text = uuid
        
        let name = UserDefaults.standard.string(forKey: "username")!
        let qans = UserDefaults.standard.string(forKey: "qans")!
        let iqans = UserDefaults.standard.string(forKey: "iqans")!
        let accuracy = String(format: "%.0f", (Double(qans)!)/(Double(iqans)! + Double(qans)!) * 100)
        let predictedscore = scorepredict()
        
        self.textView.text = "Name: \(String(describing: name))\n\nTotal Correct Answers: \(String(describing: qans))\n\nTotal Wrong Answers: \(String(describing: iqans))\n\n Accuracy: \(accuracy)%\n\n Predicted Score: \(predictedscore)"
    
        textView.sizeToFit()
    
    }
    
    func scorepredict() -> String {
        
        // Redacted 
        return predict
    }
}
