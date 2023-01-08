import UIKit
//프로토콜 자체는 자신의 인스턴스는 만들지 못한다.
//프로토콜을 임플리먼트하면 해당 프로토콜의 변수나, 메소드 설정이 강제된다.
//프로토콜도 상속이 가능하다.

//이름짓는 방식? 이런 변수와 메소드로 이름을 짓겠다?
protocol Naming {
    //get set을 통해 이름을 설정하고 가져올 수 있다.
    var name: String { get set }
    func getName() -> String
}

//나이 프로토콜
protocol AgeCountable {
    var age : Int { get set }
}

//이름과 나이의 프로토콜을 상속받는 프로토콜
protocol Friendable : Naming, AgeCountable {
}

//친구 프로토콜을 임플리먼트하는 구조체 생성
struct MyFriend : Friendable {
    var name: String // Naming의 변수가 있어야함.
    
    //Naming의 메소드가 있어야함.
    func getName() -> String {
        return self.name
    }
    var age: Int // AgeCountable의 변수가 있어야함.
}

var myFriend = MyFriend(name: "철수", age: 32)

print("내 친구의 이름은 \(myFriend.name)이고 나이는 \(myFriend.age)이다.")


