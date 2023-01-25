import UIKit

/*
 공통점 : 메모리에 올리지 않고 사용할 수 있다
 차이점 : static에는 final이라는 의미가 포함되어있어 오버라이드가 불가능함
 */

//1. 이렇게 final class로 선언하면 상속이 불가능하다.
//final class Friend {
class Friend {
    func sayhi() {
        print("sayhi!")
    }
    class func byebye() {
        print("byebye~")
    }
    //static func 는 final class func와 같다.
    static func sayhoho() {
        print("호출!")
    }
}

class BestFriend : Friend {
    class override func byebye() {
        //상속받은곳의 함수를 직접 불러오려면 super 사용.
        super.byebye()
        print("불러오고 덮어써보자 byebye!")
    }
    //final class와 같이 취급하는 static func라 덮어쓰기가 불가능하다.
    func sayhoho() {
        print("덮어 써졌나? sayhoho???")
    }
    
}

let myFriend = Friend()
myFriend.sayhi()

Friend.byebye()
Friend.sayhoho()


