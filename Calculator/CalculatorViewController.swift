//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Elzada Kushbakova on 14/6/22.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var firstNumber:  String = ""
    var secondNumber:  String = ""
    var operation: String = ""
    var result: Double = 0
    var isResultFound: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    fileprivate func getNumber(_ number: String){
        if operation.isEmpty{
            firstNumber += number
            resultLabel.text = firstNumber
        }else{
            secondNumber += number
            resultLabel.text = secondNumber
        }
    }
    
    @IBAction func numberTapped(_ sender: UIButton) {
        
        if isResultFound { reset() }
        
        switch sender.tag{
        case 0:
            getNumber("0")
        case 1:
            getNumber("1")
        case 2:
            getNumber("2")
        case 3:
            getNumber("3")
        case 4:
            getNumber("4")
        case 5:
            getNumber("5")
        case 6:
            getNumber("6")
        case 7:
            getNumber("7")
        case 8:
            getNumber("8")
        case 9:
            getNumber("9")
        default:
            print("There is no such number")
        }
    }
    
    @IBAction func operation(_ sender: UIButton) {
        switch sender.tag{
        case 12:
            //operation = "%"
            if operation.isEmpty{
                operation = "%"
            }
        case 13:
            operation = "/"
        case 14:
            operation = "*"
        case 15:
            operation = "-"
        case 16:
            operation = "+"
        default:
            print("There is no such operation")
        }
    }
    
    @IBAction func findTheResult(_ sender: UIButton) {
        
        guard let first = Double(firstNumber), let second =  Double(secondNumber) else { return }
        
        switch operation {
        case "+":
            result = first + second
            firstNumber = "\(result)"
            resultLabel.text = "\(result)"
        case "-":
            result = first - second
            firstNumber = "\(result)"
            resultLabel.text = "\(result)"
        case "/":
            if second == 0 {
                resultLabel.text = "Division by zero"
            }else{
                result = first / second
                firstNumber = "\(result)"
                resultLabel.text = "\(result)"
            }
        case "*":
            result = first * second
            firstNumber = "\(result)"
            resultLabel.text = "\(result)"
        case "%":
            result = first * second / 100
            firstNumber = "\(result)"
            resultLabel.text = "\(result)"
        default:
            print("There is no such operation")
        }
        isResultFound = true
    }
    
    @IBAction func findPercent(_ sender: UIButton) {
        if operation != "%"{
            guard let first = Double(firstNumber), let second = Double(secondNumber) else  {return}
            
            switch operation{
            case "+":
                result = first + (first / 100 * second)
            case "-":
                result = first - (first / 100 * second)
            case "*":
                result = first * (first / 100 * second)
            case "/":
                result = first / (first / 100 * second)
            default:
                print("Go home! You are tired")
            }
            isResultFound = true
            
            resultLabel.text = "\(result)"
        }
    }
    
    
    @IBAction func reverseSign(_ sender: UIButton) {
        if  isResultFound {
            if  result > 0 {
                result = -result
            }else{
                result = abs(result)
            }
            resultLabel.text = "\(result)"
        } else if !isResultFound && !operation.isEmpty{
            if var second = Double(secondNumber) {
                if second > 0 {
                    second = -second
                    secondNumber = "\(second)"
                }else{
                    second = abs(second)
                    secondNumber = "\(second)"
                }
                resultLabel.text = secondNumber
            }
        }else {
            if var first = Int(firstNumber){
                if first > 0 {
                    first = -first
                    firstNumber = "\(first)"
                }else{
                    first = abs(first)
                    firstNumber = "\(first)"
                }
                resultLabel.text = firstNumber
            }
        }
    }
    
    @IBAction func dotButton(_ sender: UIButton) {
        print("dot tapped")
        if operation.isEmpty{
            firstNumber += "."
            resultLabel.text = firstNumber
        }else{
            secondNumber += "."
            resultLabel.text = secondNumber
        }
    }
    
    func reset(){
        firstNumber = ""
        secondNumber = ""
        result = 0
        operation = ""
        isResultFound = false
    }
    
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        reset()
        resultLabel.text = ""
    }
}

