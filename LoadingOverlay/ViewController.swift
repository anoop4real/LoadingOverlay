//
//  ViewController.swift
//  LoadingOverlay
//
//  Created by Anoop M on 2019-05-18.
//  Copyright © 2019 anoop. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var overlay = LoadingOverlay.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showAgain() {
        
       showLoaderWith(message: "Showing Loader again", changeMessage: "Loader will dismiss soon!!")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        showLoaderWith(message: "Login in progress", changeMessage: "Login success!!")
    }

    func showLoaderWith(message:String, changeMessage: String){
        self.overlay.showOverlay(view: self.view, hint: message)
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { [unowned self](_) in
            self.overlay.showOverlay(view: self.view, hint: changeMessage)
        }
        Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { [unowned self](_) in
            self.overlay.hideOverlayView()
        }
    }
    // To show over navbars and tabbars use this
    func showOverAnyControls(){
        overlay.showOverlay(view: UIApplication.shared.keyWindow!)
    }
}

