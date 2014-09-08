
import UIKit
import PaybackKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow!

    func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {
        
        let list = ListViewController(nibName: nil, bundle: nil)
        let nav = UINavigationController(rootViewController: list)
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window.rootViewController = nav
        self.window.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication!) {
    }

    func applicationDidEnterBackground(application: UIApplication!) {
    }

    func applicationWillEnterForeground(application: UIApplication!) {
    }

    func applicationDidBecomeActive(application: UIApplication!) {
    }

    func applicationWillTerminate(application: UIApplication!) {
    }

}

