//
//  SettingsViewController.swift
//  TipCalc
//
//  Created by smoltamal on 10/4/19.
//  Copyright © 2019 diarreola. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipPercentageController: UISegmentedControl!
    @IBOutlet weak var moneyIcon2: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        UIView.animate(withDuration:0.8, delay: 0.0,
        // Autoreverse runs the animation backwards and Repeat cycles the animation indefinitely.
        options: [.autoreverse,.repeat], animations: { () -> Void in
           self.moneyIcon2.transform = CGAffineTransform(translationX: 0, y: 10)
        }, completion: nil)
        let defaults = UserDefaults.standard
        tipPercentageController.selectedSegmentIndex = defaults.integer(forKey: "tipPercentage")
    }
    
    func setTip(index: Int) {
        let defaults = UserDefaults.standard
        defaults.set(index, forKey: "tipPercentage")
        defaults.synchronize()
    }
    
    @IBAction func changeTip(_ sender: Any) {
        let index = Int(tipPercentageController.selectedSegmentIndex)
        let defaults = UserDefaults.standard
        defaults.set(index, forKey: "tipPercentage")
        defaults.synchronize()
    }


}
