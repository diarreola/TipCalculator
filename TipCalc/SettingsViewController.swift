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
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
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
