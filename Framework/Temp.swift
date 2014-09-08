
import Foundation
import CoreLocation

struct User {
    
    // 10374498
    let id: Int64
    
    // "John"
    let firstName: String
    
    // "Appleseed"
    let LastName: String
    
    // Unix timestamp
    let birthday: NSDate?
    
    // URL of an image, or nil
    let pictureURL: String?
    
    // Coordinates of user's home
    let home: CLLocation?
    
}


struct UserViewModel {
    
    // "John A."
    let name: String
    
    // "In 12 days", "In August", "Unknown"
    let birthday: String
    
    // .Network provides a URL, .None provides initials and fill color
    let picture: Picture
    
    // "8 miles away", "New York", "Unknown"
    let distanceToHome: String
    
    enum Picture {
        
        case Network(NSURL)
        
        case None(String,UInt64)
        
    }
    
}
