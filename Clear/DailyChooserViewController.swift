//
//  DailyChooserViewController.swift
//  SAT Daily
//
//  Created by RB on 2/28/21.
//

import UIKit

class DailyChooserViewController: UIViewController {
    
    var control = 0

    override func viewDidLoad() {
        super.viewDidLoad()
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
