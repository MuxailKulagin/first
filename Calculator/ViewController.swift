
//
//  ViewController.swift
//  Calculator
//
//  Created by mary on 10.06.2020.
//  Copyright © 2020 kuznetsov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var buttons: UIStackView!
    @IBOutlet weak var fontSizeResult: UIStepper!
    var numberOne = ""
    var numberTwo = ""
    var operand = ""
    
    //Нажатие цифр
    @IBAction func inputNumber(_ sender: UIButton) {
        if operand.isEmpty {
            numberOne = numberOne + (sender.titleLabel?.text)!
            resultLabel.text = numberOne
        } else {
            numberTwo = numberTwo + (sender.titleLabel?.text)!
            resultLabel.text = numberTwo
        }
    }
    
    //Кнопки +,-,/,*
    @IBAction func inputOperand(_ sender: UIButton) {
        operand = sender.titleLabel?.text as! String
    }
    
    //Очистка окна вывода
    @IBAction func clearAction(_ sender: Any) {
        numberOne = ""
        numberTwo = ""
        operand = ""
        resultLabel.text = "0"
    }
    
    //Кнопка =
    @IBAction func resultAction(_ sender: Any) {
        var result = 0.0
        
        switch operand {
        case "/":
            result = Double(numberOne)! / Double(numberTwo)!
        case "*":
        result = Double(numberOne)! * Double(numberTwo)!
        case "-":
        result = Double(numberOne)! - Double(numberTwo)!
        case "+":
        result = Double(numberOne)! + Double(numberTwo)!
        default:
            break
        }
        
        if result.truncatingRemainder(dividingBy: 1.0) == 00 {
            resultLabel.text = String(Int(result))
        } else {
            resultLabel.text = String(result)
        }
    }
    
    @IBAction func hiddenButtons(_ sender: UISwitch) {
        buttons.isHidden = !buttons.isHidden
        resultLabel.isHidden = !resultLabel.isHidden
        fontSizeResult.isHidden = !fontSizeResult.isHidden
    }
    
    @IBAction func sizeResultLabel(_ sender: UIStepper) {
        let font = resultLabel.font?.fontName
        let fontSize = CGFloat(sender.value)
        
        resultLabel.font = UIFont(name: font!, size: fontSize)
    }
}

