//
//  PastQuestionsChooserViewController.swift
//  SAT Daily
//
//  Created by RB on 2/28/21.
//

import UIKit

class PastQuestionsChooserViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func toPastReading(_ sender: Any) {
        performSegue(withIdentifier: "toPastReading", sender: self)
    }
    
    @IBAction func toPastWriting(_ sender: Any) {
        performSegue(withIdentifier: "toPastWriting", sender: self)
    }
    
    @IBAction func toPastMath(_ sender: Any) {
        performSegue(withIdentifier: "toPastMath", sender: self)
    }
    
    
}
