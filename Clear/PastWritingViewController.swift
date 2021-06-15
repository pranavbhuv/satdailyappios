//
//  PastReadingViewController.swift
//  SAT Daily
//
//  Created by RB on 2/28/21.
//

import UIKit

class PastWritingViewController: UIViewController {
    
    
    @IBOutlet weak var stackView: UIStackView!
    var questionid = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // let questions = UserDefaults.standard.array(forKey: "readingArray")
        let questions = UserDefaults.standard.string(forKey: "writing")!
        let questionsmax = (Int(questions) ?? 0) - 1
        stackView.axis = .vertical
        stackView.layer.cornerRadius = 30
        stackView.spacing = 30
        stackView.distribution = .fillEqually
        for questionNumber in 1...questionsmax {
          let button = UIButton()
            button.layer.masksToBounds = false
            button.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            var dateComponents = DateComponents()
            dateComponents.year = 2021
            dateComponents.month = 2
            dateComponents.day = 18 + questionNumber
            let userCalendar = Calendar(identifier: .gregorian)
            let releasedate = userCalendar.date(from: dateComponents)
            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = "MMM dd, yyyy"
            button.setTitle("Question for: \(dateFormatterPrint.string(for: releasedate)!)", for: .normal)
            
            button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .black)
            button.layer.backgroundColor = UIColor(hue: 0.6111, saturation: 0.25, brightness: 0.9, alpha: 1.0).cgColor
            button.layer.cornerRadius = 30
            button.layer.shadowOffset = CGSize(width: 5, height: 5)
            button.layer.shadowRadius = 20
            button.tag = questionNumber
            button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
          stackView.addArrangedSubview(button)
        }
    }
    
    @objc public func buttonClicked(_ sender: UIButton) {
        print("It works! \(sender.tag)")
        self.questionid = sender.tag
        performSegue(withIdentifier: "toSW", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! WritingSimQuestionViewController
        vc.actualquestionid = self.questionid
    }

}
