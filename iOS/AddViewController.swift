
import UIKit
import PaybackKit

class AddViewController: UIViewController, AddViewModelDelegate {
    
    let model: AddViewModel

    override init(nibName name: String?, bundle: NSBundle?) {
        model = AddViewModel(Context.defaultContext)

        super.init(nibName: name, bundle: bundle)

        model.delegate = self
        
        navigationItem.title = "Payback"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: "cancelPressed")
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "donePressed")
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var nameField: UITextField!
    
    var amountField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.whiteColor()
        
        nameField = UITextField(frame: CGRect(x: 20, y: 100, width: 280, height: 80))
        nameField.placeholder = "Name"
        view.addSubview(nameField)
        
        amountField = UITextField(frame: CGRect(x: 20, y: 200, width: 280, height: 80))
        amountField.placeholder = "Amount"
        view.addSubview(amountField)
    }
    
    func cancelPressed() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func donePressed() {
        model.name = nameField.text ?? ""
        model.amount = amountField.text ?? ""
        model.handleDonePressed()
    }
    
    func dismissAddView() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func showInvalidName() {
        UIAlertView(title: "Error", message: "Invalid name", delegate: nil, cancelButtonTitle: "OK").show()
        nameField.becomeFirstResponder()
    }
    
    func showInvalidAmount() {
        UIAlertView(title: "Error", message: "Invalid amount", delegate: nil, cancelButtonTitle: "OK").show()
        amountField.becomeFirstResponder()
    }
    
}
