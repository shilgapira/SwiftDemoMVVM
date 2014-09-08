
import XCTest
import PaybackKitOSX

class AddViewModelTests: XCTestCase, AddViewModelDelegate {
    
    var model: AddViewModel!

    override func setUp() {
        super.setUp()
        
        let context = Context()
        model = AddViewModel(context)
        model.delegate = self
    }
    
    override func tearDown() {
        super.tearDown()
        
        model.delegate = nil
        resetFlags()
    }
    
    

    func testNoData() {
        model.handleDonePressed()
        XCTAssert(!dismissCalled && (invalidNameCalled || invalidAmountCalled))
    }
    
    func testInvalidName() {
        model.amount = "84.00"
        
        for name in ["", "Jo", "John", "John ", " John"] {
            model.name = name
            
            model.handleDonePressed()
            XCTAssert(!dismissCalled && invalidNameCalled)
            resetFlags()
        }
    }
    
    func testInvalidAmount() {
        model.name = "John Appleseed"
        
        for amount in ["", "Abc", "A19", "..", "0"] {
            model.amount = amount
            
            model.handleDonePressed()
            XCTAssert(!dismissCalled && invalidAmountCalled)
            resetFlags()
        }
    }
    
    func testDone() {
        model.name = "John Appleseed"
        model.amount = "84.00"
        model.handleDonePressed()
        XCTAssert(dismissCalled && !invalidNameCalled && !invalidAmountCalled)
    }
    
    
    
    var dismissCalled = false
    var invalidNameCalled = false
    var invalidAmountCalled = false
    
    func resetFlags() {
        dismissCalled = false
        invalidNameCalled = false
        invalidAmountCalled = false
    }
    
    func dismissAddView() {
        dismissCalled = true
    }
    
    func showInvalidName() {
        invalidNameCalled = true
    }
    
    func showInvalidAmount() {
        invalidAmountCalled = true
    }
    
}
