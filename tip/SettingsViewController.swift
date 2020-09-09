//
//  SettingsViewController.swift
//  Tippy
//
//  Created by Jasmyne Roberts on 9/5/20.
//  Copyright © 2020 Jasmyne Roberts. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var defaultTipAmount: UISegmentedControl!
    @IBOutlet weak var isTipRounded: UISwitch!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // enable the section of segmented control that is default
        let defaultIndex = defaults.integer(forKey: "defaultTipIndex")
        defaultTipAmount.selectedSegmentIndex = defaultIndex
        
        // set visible switch to that default state
        let defaultIsRounded = defaults.bool(forKey: "roundingEnabled")
        isTipRounded.setOn(defaultIsRounded, animated: false)
        
    }
    
    // when user interacts with default tip segment
    @IBAction func changeDefaultTipIndex(_ sender: Any) {
        // set default tip index to selected segment
        defaults.set(defaultTipAmount.selectedSegmentIndex, forKey:"defaultTipIndex")
        
    }

    // when user interacts with rounding state
    @IBAction func changeDefaultRounded(_ sender: UISwitch) {
        // set default rounding state to selected state
        defaults.set(isTipRounded.isOn, forKey:"roundingEnabled")

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
