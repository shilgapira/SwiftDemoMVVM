
import Foundation

public class Context {
    
    var paybacks = [Payback]()
    
    func addPayback(payback: Payback) {
        paybacks.insert(payback, atIndex: 0)
    }
    
    public init() {
    }
    
    public class var defaultContext: Context {
        return _defaultContext
    }
    
}

private let _defaultContext = Context()
