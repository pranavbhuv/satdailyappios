//
//  PastReadingViewController.swift
//  SAT Daily
//
//  Created by RB on 2/28/21.
//

import SPAlert
import UIKit

class PastMathViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    var monthmonthid = 0
    var questionid = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        if monthmonthid == 2
        {
            stackView.axis = .vertical
            stackView.layer.cornerRadius = 30
            stackView.spacing = 30
            stackView.distribution = .fillEqually
            // Starts 18 to 28
            for questionNumber in 1...10 {
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
        
        else if monthmonthid == 3
        {
            stackView.axis = .vertical
            stackView.layer.cornerRadius = 30
            stackView.spacing = 30
            stackView.distribution = .fillEqually
            // Starts 1 to 31
            for questionNumber in 1...31 {
              let button = UIButton()
                button.layer.masksToBounds = false
                button.heightAnchor.constraint(equalToConstant: 100).isActive = true
                
                var dateComponents = DateComponents()
                dateComponents.year = 2021
                dateComponents.month = 3
                dateComponents.day = questionNumber
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
                button.tag = questionNumber + 10
                button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
              stackView.addArrangedSubview(button)
            }
        }
        
        else if monthmonthid == 4
        {
            stackView.axis = .vertical
            stackView.layer.cornerRadius = 30
            stackView.spacing = 30
            stackView.distribution = .fillEqually
            // Starts 1 to 31
            for questionNumber in 1...30 {
              let button = UIButton()
                button.layer.masksToBounds = false
                button.heightAnchor.constraint(equalToConstant: 100).isActive = true
                var dateComponents = DateComponents()
                dateComponents.year = 2021
                dateComponents.month = 4
                dateComponents.day = questionNumber
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
                button.tag = questionNumber + 10 + 31
                button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
              stackView.addArrangedSubview(button)
            }
        }
        
        else if monthmonthid == 5
        {
            stackView.axis = .vertical
            stackView.layer.cornerRadius = 30
            stackView.spacing = 30
            stackView.distribution = .fillEqually
            // Starts 1 to 31
            for questionNumber in 1...31 {
              let button = UIButton()
                button.layer.masksToBounds = false
                button.heightAnchor.constraint(equalToConstant: 100).isActive = true
                var dateComponents = DateComponents()
                dateComponents.year = 2021
                dateComponents.month = 5
                dateComponents.day = questionNumber
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
                button.tag = questionNumber + 10 + 31 + 30
                button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
              stackView.addArrangedSubview(button)
            }
        }
        
        else if monthmonthid == 6
        {
            stackView.axis = .vertical
            stackView.layer.cornerRadius = 30
            stackView.spacing = 30
            stackView.distribution = .fillEqually
            for questionNumber in 1...30 {
              let button = UIButton()
                button.layer.masksToBounds = false
                button.heightAnchor.constraint(equalToConstant: 100).isActive = true
                var dateComponents = DateComponents()
                dateComponents.year = 2021
                dateComponents.month = 6
                dateComponents.day = questionNumber
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
                button.tag = questionNumber + 10 + 31 + 30 + 31
                button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
              stackView.addArrangedSubview(button)
            }
        }
        
        else if monthmonthid == 7
        {
            stackView.axis = .vertical
            stackView.layer.cornerRadius = 30
            stackView.spacing = 30
            stackView.distribution = .fillEqually
            for questionNumber in 1...31 {
              let button = UIButton()
                button.layer.masksToBounds = false
                button.heightAnchor.constraint(equalToConstant: 100).isActive = true
                var dateComponents = DateComponents()
                dateComponents.year = 2021
                dateComponents.month = 7
                dateComponents.day = questionNumber
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
                button.tag = questionNumber + 10 + 31 + 30 + 31 + 30
                button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
              stackView.addArrangedSubview(button)
            }
        }
        
        else if monthmonthid == 8
        {
            stackView.axis = .vertical
            stackView.layer.cornerRadius = 30
            stackView.spacing = 30
            stackView.distribution = .fillEqually
            for questionNumber in 1...31 {
              let button = UIButton()
                button.layer.masksToBounds = false
                button.heightAnchor.constraint(equalToConstant: 100).isActive = true
                var dateComponents = DateComponents()
                dateComponents.year = 2021
                dateComponents.month = 8
                dateComponents.day = questionNumber
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
                button.tag = questionNumber + 10 + 31 + 30 + 31 + 30 + 31
                button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
              stackView.addArrangedSubview(button)
            }
        }
        
        else if monthmonthid == 9
        {
            stackView.axis = .vertical
            stackView.layer.cornerRadius = 30
            stackView.spacing = 30
            stackView.distribution = .fillEqually
            for questionNumber in 1...30 {
              let button = UIButton()
                button.layer.masksToBounds = false
                button.heightAnchor.constraint(equalToConstant: 100).isActive = true
                var dateComponents = DateComponents()
                dateComponents.year = 2021
                dateComponents.month = 9
                dateComponents.day = questionNumber
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
                button.tag = questionNumber + 10 + 31 + 30 + 31 + 30 + 31 + 31
                button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
              stackView.addArrangedSubview(button)
            }
        }
        
        else if monthmonthid == 10
        {
            stackView.axis = .vertical
            stackView.layer.cornerRadius = 30
            stackView.spacing = 30
            stackView.distribution = .fillEqually
            for questionNumber in 1...31 {
              let button = UIButton()
                button.layer.masksToBounds = false
                button.heightAnchor.constraint(equalToConstant: 100).isActive = true
                var dateComponents = DateComponents()
                dateComponents.year = 2021
                dateComponents.month = 10
                dateComponents.day = questionNumber
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
                button.tag = questionNumber + 10 + 31 + 30 + 31 + 30 + 31 + 31 + 30
                button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
              stackView.addArrangedSubview(button)
            }
        }
        
        else if monthmonthid == 11
        {
            stackView.axis = .vertical
            stackView.layer.cornerRadius = 30
            stackView.spacing = 30
            stackView.distribution = .fillEqually
            for questionNumber in 1...30 {
              let button = UIButton()
                button.layer.masksToBounds = false
                button.heightAnchor.constraint(equalToConstant: 100).isActive = true
                var dateComponents = DateComponents()
                dateComponents.year = 2021
                dateComponents.month = 11
                dateComponents.day = questionNumber
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
                button.tag = questionNumber + 10 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31
                button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
              stackView.addArrangedSubview(button)
            }
        }
        
        else if monthmonthid == 12
        {
            stackView.axis = .vertical
            stackView.layer.cornerRadius = 30
            stackView.spacing = 30
            stackView.distribution = .fillEqually
            for questionNumber in 1...31 {
              let button = UIButton()
                button.layer.masksToBounds = false
                button.heightAnchor.constraint(equalToConstant: 100).isActive = true
                var dateComponents = DateComponents()
                dateComponents.year = 2021
                dateComponents.month = 12
                dateComponents.day = questionNumber
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
                button.tag = questionNumber + 10 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 + 30
                button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
              stackView.addArrangedSubview(button)
            }
        }
    }
    
    @objc public func buttonClicked(_ sender: UIButton) {
        print("It works! \(sender.tag)")
        self.questionid = sender.tag
        let tag = UserDefaults.standard.string(forKey: "math")!
        let tagnum = (Int(tag) ?? 0)
        if (questionid > tagnum)
        {
            print(questionid)
            SPAlert.present(title: "Question not Released", preset: .error)
        }
        else
        {
            performSegue(withIdentifier: "toSM", sender: self)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! MathSimQuestionViewController
        vc.actualquestionid = self.questionid
    }

}
