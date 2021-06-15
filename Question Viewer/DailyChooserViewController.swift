//
//  DailyChooserViewController.swift
//  SAT Daily
//
//  Created by RB on 2/28/21.
//

import UIKit

class DailyChooserViewController: UIViewController {
    
    @IBOutlet weak var todays: UILabel!
    
    var control = 0
    @IBOutlet weak var reading: UIButton!
    @IBOutlet weak var writing: UIButton!
    @IBOutlet weak var math: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bg = UIImage(named: "todaypage")
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


    }
    
    @IBAction func toReading(_ sender: Any) {
        self.control = 1
        performSegue(withIdentifier: "toReading", sender: self)
        self.control = 0
    }
    @IBAction func toWriting(_ sender: Any) {
        self.control = 2
        performSegue(withIdentifier: "toWriting", sender: self)
        self.control = 0
    }
    @IBAction func toMath(_ sender: Any) {
        self.control = 3
        performSegue(withIdentifier: "toMath", sender: self)
        self.control = 0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (control == 1)
        {
            let vc = segue.destination as! SavedReadingSimulationViewController
            let dailyToday = Int(UserDefaults.standard.string(forKey: "reading")!) ?? 1
            vc.actualquestionid = dailyToday
        }
        else if (control == 2)
        {
            let vc = segue.destination as! WritingSimQuestionViewController
            let dailyToday = Int(UserDefaults.standard.string(forKey: "writing")!) ?? 1
            vc.actualquestionid = dailyToday
        }
        else if (control == 3)
        {
            let vc = segue.destination as! MathSimQuestionViewController
            let dailyToday = Int(UserDefaults.standard.string(forKey: "math")!) ?? 1
            vc.actualquestionid = dailyToday
        }
    }
    

}
