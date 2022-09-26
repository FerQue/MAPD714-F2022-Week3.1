import UIKit


// Internal Documentation
// File Name: MAPD714-F2022-Assignment 1 - Calculator App - Part 1 - Create the app UI
// Author's name: Fernando Quezada - 301286477, Hisham Abu Sanimeh - 301289364
// App Description: This app performs mathematical operations such as addition,
// substraction, multiplication, and division.
// Version Information: version 1

class ViewController: UIViewController {

    //Result Label
    
    @IBOutlet weak var ResultLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    //Event Handlers
    @IBAction func OperatorButton_Pressed(_ sender: UIButton)
    {
        
    }
    
    
    @IBAction func NumberButton_Pressed(_ sender: UIButton)
    {
        var button = sender as UIButton
//        resultLabel.text = button.titleLabel!.text
        

    }
    
    
    @IBAction func ExtraButton_Pressed(_ sender: UIButton)
    {
        
    }
    
}

