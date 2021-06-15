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
        let qans = UserDefaults.standard.string(forKey: "qans")!
        let iqans = UserDefaults.standard.string(forKey: "iqans")!
        let accur = (Double(qans)!)/(Double(iqans)! + Double(qans)!) * 100
        var predict = "1100"
        
        if accur <= 20 {
            predict = "1100 - 1150"
        }
        else if accur <= 30 {
            predict = "1150 - 1200"
        }
        else if accur <= 40 {
            predict = "1200 - 1250"
        }
        else if accur <= 50 {
            predict = "1250 - 1300"
        }
        else if accur <= 60 {
            predict = "1300 - 1350"
        }
        else if accur <= 70 {
            predict = "1350 - 1400"
        }
        else if accur <= 80 {
            predict = "1400 - 1450"
        }
        else if accur <= 90 {
            predict = "1450 - 1500"
        }
        else if accur <= 100 {
            predict = "1500 - 1550"
        }
        return predict
    }
}
