//
//  ViewController.swift
//  Tippy
//
//  Created by Jasmyne Roberts on 7/31/20.
//  Copyright © 2020 Jasmyne Roberts. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tipAmountLabel.text = String(format: "$%.2f", 0)
        totalLabel.text = String(format: "$%.2f", 0)
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // enable the section of segmented control that is default
        let defaultIndex = defaults.integer(forKey: "defaultTipIndex")
        tipControl.selectedSegmentIndex = defaultIndex
        
        billAmountTextField.becomeFirstResponder()
    }
    
    @IBAction func calculateTip(_ sender: Any) {

        // get bill amount
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [0.15, 0.18, 0.2]
        let tipIndex = tipControl.selectedSegmentIndex
        
        // check if bill is set to be rounded
        let defaultIsRounded = defaults.bool(forKey: "roundingEnabled")
        
        // calcuate tip and total
        var tip = bill * tipPercentages[tipIndex]
        var total = bill + tip
        
        if defaultIsRounded {
            tip += round(total) - total
            total = round(total)
        }
        
        // update the tip and total labels
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

