
import UIKit
import PaybackKit

class ListViewController: UITableViewController {
    
    let model: ListViewModel
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        model = ListViewModel(Context.defaultContext)
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        navigationItem.title = "Payback"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addPressed")
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        refresh()
    }
    
    func refresh() {
        model.refresh()
        tableView.reloadData()
    }
    
    func addPressed() {
        let add = AddViewController(nibName: nil, bundle: nil)
        let nav = UINavigationController(rootViewController: add)
        presentViewController(nav, animated: true, completion: nil)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let reuseIdentifier = "Cell"
        let dequeued = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier) as UITableViewCell?
        let cell = dequeued ?? UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: reuseIdentifier)
        
        let item = model.items[indexPath.row]
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.amount
        
        return cell
    }

}
