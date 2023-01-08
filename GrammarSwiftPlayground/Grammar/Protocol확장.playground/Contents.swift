import UIKit

protocol Naming {
    var lastname : String { get set }
    var firstname : String { get set }
    func getName() -> String
    //프로토콜은 바디or로직 을 가질 수 없다. 그러나 방법은 있다.
}

//바로 확장(extension)
extension Naming {
    func getFullname() -> String {
        return self.lastname + " " + self.firstname
    }
}

struct Friend : Naming {
    //네이밍의 프로토콜을 준수한다.
    var lastname: String
    var firstname: String
    func getName() -> String {
        return self.lastname
    }
}

let myFriend = Friend(lastname: "김", firstname: "고무")

myFriend.getName() // 단순 프로토콜만.
myFriend.getFullname() // 프로토콜확장.
