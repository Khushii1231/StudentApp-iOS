//
//  ViewController.swift
//  StudentApp
//
//  Created by swati mane on 10/09/22.
//

import UIKit
import Lottie

class HomeController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    
    @IBOutlet weak var goBtn: UIButton!
    
    @IBAction func goButton(_ sender: UIButton) {
   
       }
    
    @IBOutlet weak var titleLable: UILabel!
    private var animationView: AnimationView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goBtn.layer.cornerRadius = goBtn.frame.width/2
        goBtn.layer.masksToBounds=true
        
        animationView = .init(name: "student")
        animationView!.frame = view.bounds
        animationView!.contentMode = .scaleAspectFit
        
        
        animationView!.loopMode = .loop
        
        // 5. Adjust animation speed
        animationView!.animationSpeed = 0.5
        
        view.addSubview(animationView!)
        
        // 6. Play animation
        animationView!.play()
       view.sendSubviewToBack(animationView!)

        titleLable.text = ""
        var charIndex = 0.0
        let titleText = "StudentPortal"

        for letter in titleText{
            Timer.scheduledTimer(withTimeInterval: 0.1*charIndex, repeats: false) { (timer) in
                self.titleLable.text?.append(letter)
            }
            charIndex = charIndex+1
        }
    }

}


