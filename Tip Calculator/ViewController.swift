//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Tin N Vo on 8/31/15.
//  Copyright © 2015 Tin Vo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var textMealCost: UITextField!
    @IBOutlet var textTipPercentage: UITextField!
    
    @IBOutlet var labelTip: UILabel!
    @IBOutlet var labelTotal: UILabel!
    
    var mealCost = ""
    var tipPercentage = ""
    var totalTip : Float = 0.0
    var total : Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateAct(sender: UIButton) {
        calculateTip()
    }

    @IBAction func clearAct(sender: UIButton) {
        clear()
    }
    
    func calculateTip() {
        mealCost = textMealCost.text!
        tipPercentage = textTipPercentage.text!
        let floatMealCost = Float(mealCost)
        let floatTipPercentage = Float(tipPercentage)
            
        if (floatMealCost != nil && floatTipPercentage != nil) {
            totalTip = floatMealCost! * (floatTipPercentage!/100)
            total = floatMealCost! + totalTip
        }
        hideKeyboard()
        printTip()
    }
    
    func printTip() {
        let formatTip = String(format: "%0.2f", totalTip)
        let formatTotal = String(format: "%0.2f",total)
        
        labelTip.text = "Tip: $\(formatTip)"
        labelTotal.text = "Total: $\(formatTotal)"
    }

    func clear() {
        textMealCost.text = ""
        textTipPercentage.text = ""
        labelTip.text = "Tip: $0.00"
        labelTotal.text = "Total: $0.00"
        hideKeyboard()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        hideKeyboard()
    }
    
    func hideKeyboard() {
        textMealCost.resignFirstResponder()
        textTipPercentage.resignFirstResponder()
    }
}

