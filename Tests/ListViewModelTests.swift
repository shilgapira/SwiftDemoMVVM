
import XCTest
import PaybackKitOSX

class ListViewModelTests: XCTestCase, ListViewModelDelegate, AddViewModelDelegate {
    
    var list: ListViewModel!
    
    var add: AddViewModel!

    override func setUp() {
        super.setUp()

        let context = Context()
        
        list = ListViewModel(context)
        list.delegate = self
        
        add = AddViewModel(context)
        add.delegate = self
    }
    
    override func tearDown() {
        super.tearDown()

        list.delegate = nil
        add.delegate = nil
    }

    
    
    func testEmpty() {
        let items = list.items
        XCTAssert(items.isEmpty)
    }
    
    func testNotEmpty() {
        add.name = "John Appleseed"
        add.amount = "84"
        add.handleDonePressed()
        
        let items = list.items
        XCTAssert(items.count == 1)
        
        let item = items[0]
        XCTAssert(item.title == "John A.")
    }
    
    

    func showAddView() {
    }
    
    func dismissAddView() {
    }
    
    func showInvalidAmount() {
    }
    
    func showInvalidName() {
    }
    
}
