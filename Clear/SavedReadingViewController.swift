//
//  SavedReadingViewController.swift
//  SAT Daily
//
//

import UIKit

class SavedReadingViewController: UIViewController {



    @IBOutlet weak var stackView: UIStackView!
    var questionid = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let questions = UserDefaults.standard.array(forKey: "readingArray")
        stackView.axis = .vertical
        stackView.layer.cornerRadius = 30
        stackView.spacing = 30
        stackView.distribution = .fillEqually
        for questionNumber in questions ?? [] {
          let button = UIButton()
            button.layer.masksToBounds = false
            button.heightAnchor.constraint(equalToConstant: 100).isActive = true
            button.setTitle("Passage ID: \(questionNumber)", for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .black)
            button.layer.backgroundColor = UIColor(hue: 0.6111, saturation: 0.25, brightness: 0.9, alpha: 1.0).cgColor
            button.layer.cornerRadius = 30
            button.layer.shadowOffset = CGSize(width: 5, height: 5)
            button.layer.shadowRadius = 20
            button.tag = questionNumber as! Int
            button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
          stackView.addArrangedSubview(button)
        }
    }
    
    @objc public func buttonClicked(_ sender: UIButton) {
        print("It works! \(sender.tag)")
        self.questionid = sender.tag
        performSegue(withIdentifier: "toSR", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! SavedReadingSimulationViewController
        vc.actualquestionid = self.questionid
    }
}
