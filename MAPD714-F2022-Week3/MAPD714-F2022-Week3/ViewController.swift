import UIKit

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
        ResultLabel.text = button.titleLabel!.text
        
        
        
    }
    
    
    @IBAction func ExtraButton_Pressed(_ sender: UIButton)
    {
        
    }
    
}

