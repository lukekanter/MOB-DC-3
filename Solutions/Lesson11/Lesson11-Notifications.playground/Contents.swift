import Foundation
class NotificationSender {
    
    func register() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "receive", name: "TEST", object: nil)
    }
    
    func post() {
        NSNotificationCenter.defaultCenter().postNotificationName("TEST", object: self, userInfo: nil)
    }
    
    func receive() {
        println("Notification received!")
    }
    
}

let n = NotificationSender()
n.register()
n.post()


