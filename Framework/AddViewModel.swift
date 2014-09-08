
import Foundation

public class AddViewModel {

    public let context: Context
    
    public init(_ context: Context) {
        self.context = context
    }
    

    public weak var delegate: AddViewModelDelegate?
    
    public func handleDonePressed() {
        if !validateName() {
            delegate?.showInvalidName()
        } else if !validateAmount() {
            delegate?.showInvalidAmount()
        } else {
            addPayback()
            delegate?.dismissAddView()
        }
    }
    
    
    public var amount = ""
    
    public var name = ""
    
    var nameComponents : [String] {
        return name.componentsSeparatedByString(" ").filter { !$0.isEmpty }
    }
    
    
    func validateName() -> Bool {
        return nameComponents.count >= 2
    }
    
    func validateAmount() -> Bool {
        let value = (amount as NSString).doubleValue
        return value.isNormal && value > 0
    }
    
    
    func addPayback() {
        let names = nameComponents
        let amount = (self.amount as NSString).doubleValue
        
        let payback = Payback(firstName: names[0], lastName: names[1], createdAt: NSDate(), amount: amount)
        
        context.addPayback(payback)
    }
    
}

public protocol AddViewModelDelegate: class {
    
    func dismissAddView()
    
    func showInvalidName()
    
    func showInvalidAmount()
    
}
