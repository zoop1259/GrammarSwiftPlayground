import UIKit

//Generic 포괄적인

//제네릭 <T>
//제네릭으로 어떤 자료형이 들어올 수 있도록 설정
struct MyArray<SomeElement> {
    
    //멤버변수
    var elements = [SomeElement]()

    //생성자 메소드 , 앞에 언더바를 넣으면 다음에 사용할떄 매개변수 이름생략가능
    init(_ elements: [SomeElement]) {
        self.elements = elements
    }
}

struct Friend {
    var name: String
}

struct KkangCoder {
    var name: String
}

//코드스니펫 사용시 : MyArray(<#T##elements: [_]##[_]#>)
var mySomeArray = MyArray([1,2,3])
var myStringArray = MyArray(["가", "나"])

let firstFriend = Friend(name: "철수")
let secFriend = Friend(name: "영희")

var myFriendsArray = MyArray([firstFriend, secFriend])
print(mySomeArray)
print(myStringArray)
print(myFriendsArray)





