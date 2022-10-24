// File name: MainViewController.swift

// Authors

// Name: Hisahm Abu Sanimeh
// StudentID: 301289364

// Name: Fernando Quezada
// StudentID: 301286477

// Date: 09-Oct-2022

// App description:
// Assignment 2 Part 2 -Basic Calculator Functions.

// Version: xCode 14.0.1

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var proccessLabel: UILabel!
    
    var error: Bool = false
    
    // Stack for numbersStack
    var numbersStack = Stack<Double>()
    
    // Stack for operators
    var operators = Stack<String>()
    
    //    last input of numbers
    var lastProccessInput:String = "0.0";
    
    
    // Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // check if it's operator
    func isOperator(op: String) -> Bool{
        return op == "+" || op == "-" || op == "*" || op == "/";
    }
    
    // Function to get operator value
    func getOperatorValue(op: String) -> Int {
        if (op == "+" || op == "-") {
            return 1;
        }
        if (op == "*" || op == "/") {
            return 5;
        }
        return 0;
    }
    
    
    // click listeneer for dicmal button
    @IBAction func btnDecimalPoint(_ sender: UIButton) { // Done
        if(!(lastProccessInput.contains("."))){
            proccessLabel.text = proccessLabel.text! + "."
            
            let subs: [String] = proccessLabel.text!.split(separator: " ").map({ substr in String(substr) })
            lastProccessInput = subs[(subs.count)-1]
        }
        
    }
    
    // click listeneer for back space button
    @IBAction func btnBackPressed(_ sender: UIButton) {
        
        if(proccessLabel.text!.count == 1){
            proccessLabel.text = "0"
        }else{
            proccessLabel.text?.removeLast()
        }
        doResult()
        
    }
    
    // get Default for proccess input
    func getDefaultProccesslabel(text: String) -> String {
        return text == "0" ? "" : text
    }
    // click listeneer for Number buttons 1,2,3,4,5,6,7,8,9
    @IBAction func btnNumbersPressed(_ sender: UIButton) { // Done
        
    
        
        let proccessText = getDefaultProccesslabel(text: proccessLabel.text!)
        proccessLabel.text = proccessText + String(sender.tag)
        let input: String = proccessLabel.text!
        
        // split the input to list
        let subs: [String] = input.split(separator: " ").map({ substr in String(substr) })
        
        lastProccessInput = subs[(subs.count)-1]
        print(String(lastProccessInput))
        
        // To Autoamtic result when we enter the Numbers
        doResult()
        
    }
    
    // Clear Data
    @IBAction func btnClearPressed(_ sender: UIButton) { // Done
        proccessLabel.text = "0"
        resultLabel.text = "0"
    }
    
    
    // Click Listener for operation buttons { +/- , % , * , / , - , + }
    @IBAction func btnOperationPressed(_ sender: UIButton) {
        let isEqualSpace:Bool = ( proccessLabel.text!.suffix(1) == " ")
        
        // get operations by tag
        switch sender.tag {
        case 31: // "+/-"
            if(!isEqualSpace){
                let res = Int(proccessLabel.text!)! * -1
                proccessLabel.text?.removeLast()
                proccessLabel.text =  String(res)
            }
            
        case 32: // "%"
            
            let value = Double(lastProccessInput)! / 100
            print(value)
            for char in proccessLabel.text!.reversed(){
                if(char != " "){
                    proccessLabel.text!.removeLast()
                }else{
                    break
                }
            }
            // set new value
            lastProccessInput=String(value)
            proccessLabel.text = proccessLabel.text! + String(value)
            
        case 33: // "/"
            if(!isEqualSpace){
                proccessLabel.text = proccessLabel.text! + " " + "/" + " "
            }
            
        case 34: // "x"
            if(!isEqualSpace){
                proccessLabel.text = proccessLabel.text! + " " + "*" + " "
                
            }
            
        case 35: // "-"
            if(!isEqualSpace){
                proccessLabel.text = proccessLabel.text! + " " + "-" + " "
            }
            
        case 36: // "+"
            
            if(!isEqualSpace){
                proccessLabel.text = proccessLabel.text! + " " + "+" + " "
            }
            
            
        case 40: // "sin"
            
            var value = sin(Double(lastProccessInput)! * Double.pi / 180)
            value = round(value * 100000000) / 100000000.0
           
            print(value)
            
            // Remove last number
            for char in proccessLabel.text!.reversed(){
                if(char != " "){
                    proccessLabel.text!.removeLast()
                }else{
                    break
                }
            }
            lastProccessInput=String(value)
            proccessLabel.text = proccessLabel.text! + String(value)
            
            
            
            
        case 41: // "cos"
            
            
            var value = cos(Double(lastProccessInput)! * Double.pi / 180)
            value = round(value * 100000000) / 100000000.0
           
            print(value)
            
            // Remove last number
            for char in proccessLabel.text!.reversed(){
                if(char != " "){
                    proccessLabel.text!.removeLast()
                }else{
                    break
                }
            }
            lastProccessInput=String(value)
            proccessLabel.text = proccessLabel.text! + String(value)
            
            
            
            
        case 42: // "tan"
            
         
            var value = tan(Double(lastProccessInput)! * Double.pi / 180)
            value = round(value * 100000000) / 100000000.0
           
            print(value)
            
            // Remove last number
            for char in proccessLabel.text!.reversed(){
                if(char != " "){
                    proccessLabel.text!.removeLast()
                }else{
                    break
                }
            }
            lastProccessInput=String(value)
            proccessLabel.text = proccessLabel.text! + String(value)
            
            
            
        case 43: // "10x"
            
     
            
               var value = 10 * Double(lastProccessInput)!
               value = round(value * 100000000) / 100000000.0
              
               print(value)
               
               // Remove last number
               for char in proccessLabel.text!.reversed(){
                   if(char != " "){
                       proccessLabel.text!.removeLast()
                   }else{
                       break
                   }
               }
               lastProccessInput=String(value)
               proccessLabel.text = proccessLabel.text! + String(value)
               
               
            
            
        case 44: // "√x"
            
            if(!isEqualSpace){
                proccessLabel.text = proccessLabel.text! + " " + "/" + " "
            }
            
        case 45: // "x²"
            
         
            
               var value = Double(lastProccessInput)! * Double(lastProccessInput)!
               value = round(value * 100000000) / 100000000.0
              
               print(value)
               
               // Remove last number
               for char in proccessLabel.text!.reversed(){
                   if(char != " "){
                       proccessLabel.text!.removeLast()
                   }else{
                       break
                   }
               }
               lastProccessInput=String(value)
               proccessLabel.text = proccessLabel.text! + String(value)
               
               
            
        case 46: // "π"
            
        var   value = round(Double.pi * 100000000) / 100000000.0
            
                    proccessLabel.text =
            proccessLabel.text! + " " + "*" + " " + String(value)
            
            lastProccessInput = String(value)
            
        case 47: // "Rand"
            
            
            let proccessText = getDefaultProccesslabel(text: proccessLabel.text!)
            
    
            proccessLabel.text = proccessText + generateRandomNumber()
            let input: String = proccessLabel.text!
            
            // split the input to list
            let subs: [String] = input.split(separator: " ").map({ substr in String(substr) })
            
            lastProccessInput = subs[(subs.count)-1]
            print(String(lastProccessInput))
            
            // To Autoamtic result when we enter the Numbers
            doResult()
            
            
        default:
            print("Invalid..")
        }
    }
    
    // Do get the simple operator - Expression
    func isSimpleOperatorPrecedence(firstOp: String,secondOp:String) -> Bool {
        return  getOperatorValue(op: firstOp) > getOperatorValue(op: secondOp)
    }
    
    // Click listener for equal button
    @IBAction func btnEqual(_ sender: UIButton) {
        doResult()
    }
    
    //    set the result in result label
    func doResult(){
        error = false
        
        let input: String = proccessLabel.text!
        
        //       split input to list
        let list: [String] = input.split(separator: " ").map({ substr in String(substr) })
        
        let listLength: Int = (list.count)-1
        
        for n in 0...listLength {
            let data: String = list[n]
            
            if (data.isNumber) {
                numbersStack.push(Double(data)!);
            } else if (
                operators.isEmpty()
                ||
                isSimpleOperatorPrecedence(firstOp: data, secondOp: operators.peek())
            ) {
                //                it will add only when it's simple
                //                Example :
                //                operator  (/ , +) true
                //                operator  (/ , *) false
                //                operator  (+ , /) false
                
                operators.push(data);
            } else {
                while (!operators.isEmpty() &&
                       !isSimpleOperatorPrecedence(firstOp: data, secondOp: operators.peek()))
                {
                    //                it will add only when it's complicated
                    //                Example :
                    //                operator  (/ , *) true
                    //                operator  (+ , /) true
                    
                    
                    let toProcess: String = operators.pop();// pop 1*
                    
                    doEvaluation(op: toProcess);
                }
                operators.push(data);
                print(numbersStack)
            }
            
        }
        
        while (!operators.isEmpty()) { // Last Operation
            //it's alwayes one operator here
            print(operators.peek() + "last operators")
            doEvaluation(op: operators.pop());
        }
        // Print the result if no error.
        if (error == false) {
            var result: Double = numbersStack.pop();
            // Round result to 8 decimal places
            result = round(result * 100000000) / 100000000.0
            resultLabel.text = String(result.clean)
            
        }
    }
    
    
    //    calclate the left and right number with operator
    func doEvaluation(op: String) {
        
        var leftNum: Double
        var rightNum: Double
        
        if (numbersStack.isEmpty()) {
            print("right Expression error.");
            error = true;
            return;
        } else {
            rightNum =  numbersStack.pop();
        }
        
        if (numbersStack.isEmpty()) {
            print("left Expression error.");
            error = true;
            return;
        } else {
            leftNum = numbersStack.pop();
        }
        
        // Store result
        var result: Double = 0
        
        if (op == "+") {
            result = leftNum + rightNum;
        } else if (op == "-") {
            result = leftNum - rightNum;
        } else if (op == "*") {
            result = leftNum * rightNum;
        } else if(op == "/") {
            result = leftNum / rightNum;
        } else {
            print("Operator error.");
            error = true;
        }
        numbersStack.push(result);
    }
}


// Clean double values example  2.00 to 2
extension Double {
    var clean: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}

func generateRandomNumber() -> String {
    return String(Float(arc4random()) / Float(UInt32.max))
}


// Check if this string is number
extension String  {
    var isNumber: Bool {
        let str: String = self as String
        return Int(str) != nil || Double(str) != nil
        
    }
}

