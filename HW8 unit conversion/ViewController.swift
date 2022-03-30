//
//  ViewController.swift
//  HW8 unit conversion
//
//  Created by Latifah on 2022/3/28.
//

import UIKit
enum TaxType:Int{
    case taxInclude
    case taxFree
}

class ViewController: UIViewController {
    @IBOutlet weak var poundLabel: UILabel!
    @IBOutlet weak var haveToPayLabel: UILabel!
    @IBOutlet weak var kilogramTextField: UITextField!
    @IBOutlet weak var taxSegmentControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func caculate(_ sender: UIButton) {
        var taxTypeCost = 0.0
        let taxType = TaxType(rawValue: taxSegmentControl.selectedSegmentIndex)!
        switch taxType {
        case .taxInclude:
            taxTypeCost = 120.0
            print("不包稅")
        case .taxFree:
            taxTypeCost = 140.0
            print("包稅")
        }
        
        if let kilogramText = kilogramTextField.text,
           let kilogramNum = Double(kilogramText) {
            let kg = Measurement(value: kilogramNum, unit: UnitMass.kilograms)
            let pound = kg.converted(to: .pounds)
            poundLabel.text = String(format:"%.2f",pound.value)
            haveToPayLabel.text = String(format: "%.2f", pound.value*taxTypeCost)
            
        }
        view.endEditing(true)
     
    }
    
}

