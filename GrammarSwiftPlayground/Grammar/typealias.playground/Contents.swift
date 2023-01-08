import UIKit

protocol Naming {
    func getName() -> String
}

protocol Aging {
    func getAge() -> Int
}

//typealias를 통해 별명을 만들어 준다고 생각하면됨.
//준수하는것들이 많아지면 복잡하기 때문에 사용해주면 보기 좋아짐.
typealias Friendable = Naming & Aging

struct Friend : Friendable {
    
    var name : String
    var age : Int
    
    func getName() -> String {
        return self.name
    }
    func getAge() -> Int {
        return self.age
    }
}


//자료형이나 클래스 구조체 클로저등 모든곳에 사용가능
typealias FriendName = String
var friendName : String = "강대민"

//이름을 바꿔주는 개념이라고 보면된다?
typealias Friends = [Friend]
var myFriendsArray : Friends = []

typealias StringBlock = (String) -> Void

/* 원래 이렇게 사용해야 하지만
func sayHi(completion : (String) -> Void) {
    print("hi?")
    completion("오늘도 빡코딩")
}
*/

//이렇게 가능
func sayHi(completion : StringBlock) {
    print("hi?")
    completion("오늘도 빡코딩")
}

sayHi(completion: { saying in
    print("여기서 받음 : ", saying)
})

class MyClass {
    enum MY_TYPE {
        case DOG
        case CAT
        case BIRD
    }
    var myType = MY_TYPE.DOG
}

//MyClass.MY_TYPE
//이런게 귀찮다? 싶으면!
typealias MyType = MyClass.MY_TYPE

var myClass = MyClass()

myClass.myType = .DOG

print("나의 타입은 : ", myClass.myType)
