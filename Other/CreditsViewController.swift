//
//  CreditsViewController.swift
//  SAT Daily
//
//  Created by RB on 1/4/21.
//

import UIKit

class CreditsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        assignbg()
    }
    

    func assignbg()
    {
        let bg = UIImage(named: "creditspage")
        var imageView: UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.clipsToBounds = true
        imageView.image = bg
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }

}
