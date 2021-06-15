

import AVKit
import XCDYouTubeKit
import Firebase
import UIKit

class MathConceptsViewController: UIViewController {

    @IBOutlet weak var tconcept: UILabel!
    @IBOutlet weak var playerViewContainer: UIView!
    @IBOutlet weak var stackView: UIStackView!
    
    // Article ID
    var questionid = 0
    var db: Firestore!
        
    let playerViewController = AVPlayerViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tconcept.layer.backgroundColor = UIColor(hue: 0.5611, saturation: 0.4, brightness: 0.74, alpha: 1.0).cgColor
        tconcept.layer.cornerRadius = 20
        tconcept.layer.masksToBounds = true
        
        playerViewContainer.layer.cornerRadius = 20
        playerViewContainer.layer.masksToBounds = true
        
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        
        addStuff()
        
        let docRef = db.collection("mathconcepts").document("video")
        docRef.getDocument{ (document, error) in
            if let document = document, document.exists {
                let videoId = document.get("code") as! String
                XCDYouTubeClient.default().getVideoWithIdentifier(videoId, completionHandler: { [self] video, error in
                    if let video = video {
                        AVPlayerViewControllerManager.shared.video = video
                        let playerViewController = AVPlayerViewControllerManager.shared.controller
                        playerViewController.allowsPictureInPicturePlayback = false
                        playerViewController.view.frame = playerViewContainer.bounds
                        addChild(playerViewController)
                        if let view = playerViewController.view {
                            playerViewContainer.addSubview(view)
                        }
                        playerViewController.didMove(toParent: self)
                    } else {
                        print(error!)
                    }
                })

            } else {
                print("Document does not exist!")
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        AVPlayerViewControllerManager.shared.controller.player?.pause()
    }

    func addStuff()
    {
        let resourcemax = UserDefaults.standard.string(forKey: "mathconceptmax")!
        let aor = Int(resourcemax) ?? 0
        stackView.axis = .vertical
        stackView.layer.cornerRadius = 30
        stackView.spacing = 30
        stackView.distribution = .fillEqually
        for resourceNumber in 1...aor {
          let button = UIButton()
            button.layer.masksToBounds = false
            button.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            var title = ""
            let docRef = db.collection("mathconcepts").document(String(resourceNumber))
            docRef.getDocument{ (document, error) in
                if let document = document, document.exists {
                    title = document.get("title") as! String
                    button.setTitle("\(title)", for: .normal)
                } else {
                    print("Document does not exist!")
                }
            }
                        
            button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .black)
            button.layer.backgroundColor = UIColor(hue: 0.6111, saturation: 0.25, brightness: 0.9, alpha: 1.0).cgColor
            button.layer.cornerRadius = 30
            button.layer.shadowOffset = CGSize(width: 5, height: 5)
            button.layer.shadowRadius = 20
            button.tag = resourceNumber
            button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
          stackView.addArrangedSubview(button)
        }
    }
        
    @objc public func buttonClicked(_ sender: UIButton) {
        self.questionid = sender.tag
        performSegue(withIdentifier: "toSR", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! SavedReadingSimulationViewController
        vc.actualquestionid = self.questionid
        vc.articlecheck = 3
    }
}
