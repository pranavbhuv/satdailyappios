//
//  MathMonthViewController.swift
//  SAT Daily
//
//  Created by RB on 3/7/21.
//

import UIKit

class MathMonthViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    var monthid = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        stackView.axis = .vertical
        stackView.layer.cornerRadius = 30
        stackView.spacing = 30
        stackView.distribution = .fillEqually
        let monthno = UserDefaults.standard.string(forKey: "monthno")!
        let monthnum = (Int(monthno) ?? 0)
        for monthNumber in 2...monthnum {
          let button = UIButton()
            button.layer.masksToBounds = false
            button.heightAnchor.constraint(equalToConstant: 100).isActive = true
            var dateComponents = DateComponents()
            dateComponents.year = 2021
            dateComponents.month = 0 + monthNumber
            let userCalendar = Calendar(identifier: .gregorian)
            let releasedate = userCalendar.date(from: dateComponents)
            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = "MMMM, yyyy"
            button.setTitle("Questions for: \(dateFormatterPrint.string(for: releasedate)!)", for: .normal)
            
            button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .black)
            button.layer.backgroundColor = UIColor(hue: 0.6111, saturation: 0.25, brightness: 0.9, alpha: 1.0).cgColor
            button.layer.cornerRadius = 30
            button.layer.shadowOffset = CGSize(width: 5, height: 5)
            button.layer.shadowRadius = 20
            button.tag = monthNumber
            button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
          stackView.addArrangedSubview(button)
            
        }
    }
    

        @objc public func buttonClicked(_ sender: UIButton) {
            print("It works! \(sender.tag)")
            self.monthid = sender.tag
            performSegue(withIdentifier: "toMQ", sender: self)
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let vc = segue.destination as! PastMathViewController
            vc.monthmonthid = self.monthid
        }
    }
