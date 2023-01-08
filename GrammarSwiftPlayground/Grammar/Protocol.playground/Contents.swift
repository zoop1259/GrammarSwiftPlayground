import UIKit

//프로토콜이란 약속.
// **able, **ing

//이 약속으로 네이밍을 하겠다.
protocol Naming {
    //우린 이 변수를 가지고 있을겁니다. 라고 약속
    var name : String { get set }
    //우린 이 메소드를 가지고 있을겁니다. 라고 약속
    func getName() -> String
}

/*
//이렇게만하면 약속된 변수와 메소드를 왜 가지고 있지 않는지 묻는 오류가 나온다.
//Type 'Friend' does not conform to protocol 'Naming'
//Do you want to add protocol stubs?
struct Friend : Naming {
}
*/

struct Friend : Naming {
    var name: String
    func getName() -> String {
        return "내 친구 : " + self.name
    }
}

var myFriend = Friend(name: "김김김")

myFriend.getName()

