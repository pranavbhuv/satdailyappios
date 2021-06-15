//
//  PastQuestionsChooserViewController.swift
//  SAT Daily
//
//  Created by RB on 2/28/21.
//

import UIKit

class PastQuestionsChooserViewController: UIViewController {

    @IBOutlet weak var todays: UILabel!
    @IBOutlet weak var reading: UIButton!
    @IBOutlet weak var writing: UIButton!
    @IBOutlet weak var math: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let bg = UIImage(named: "savedpage")
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
