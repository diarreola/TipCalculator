//
//  ViewController.swift
//  TipCalc
//
//  Created by smoltamal on 10/3/19.
//  Copyright © 2019 diarreola. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var moneyIcon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        UIView.animate(withDuration:0.8, delay: 0.0,
        // Autoreverse runs the animation backwards and Repeat cycles the animation indefinitely.
        options: [.autoreverse,.repeat], animations: { () -> Void in
           self.moneyIcon.transform = CGAffineTransform(translationX: 0, y: 10)
        }, completion: nil)
        billField.becomeFirstResponder()
        
    }

    @IBAction func calculateTip(_ sender: Any) {
        
        // Get the bill amount
        let bill = Double(billField.text!) ?? 0
        
        // Calculate the tip and total
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        // update the tip and total labels
        tipLabel.text = String(format:"$%.2f", tip)
        totalLabel.text = String(format:"$%.2f", total)
    }
    
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "tipPercentage")
        self.calculateTip(tipControl as Any)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
    }
    
    @IBAction func controlChanged(_ sender: Any) {
        self.calculateTip(tipControl as Any)
    }
}

