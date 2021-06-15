//
//  SavedChooseViewController.swift
//  SAT Daily
//
//  Created by RB on 12/31/20.
//

import UIKit

class SavedChooseViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // assignbg()
    }
    
    @IBAction func toReading(_ sender: Any) {
        performSegue(withIdentifier: "toSavedReading", sender: self)
    }
    @IBAction func toWriting(_ sender: Any) {
        performSegue(withIdentifier: "toSavedWriting", sender: self)
    }
    @IBAction func toMath(_ sender: Any) {
        performSegue(withIdentifier: "toSavedMath", sender: self)
    }
    
    func assignbg()
    {
        let bg = UIImage(named: "savedscreen")
        var imageView: UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.clipsToBounds = true
        imageView.image = bg
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }

}
