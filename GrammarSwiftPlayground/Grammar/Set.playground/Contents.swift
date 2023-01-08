import UIKit

//배열과 비슷하다.
//값은 중복될 수 없다. (고유해야 한다.)
//같은 값을 넣어도 한녀석만 남는다.
var mySet = Set<Int>()

mySet.insert(1) //true
mySet.insert(2) //true
mySet.insert(2) //false
mySet.insert(3) //true
mySet.insert(3) //false

print("mySet의 Count는 : \(mySet.count)") //5가 아니라 3이 된다.
print("mySet의 내용물은 : \(mySet)") //딕셔너리처럼 순서가 없다.

//배열이나 딕셔너리처럼 반복문을 사용할 수 있다.

for item in mySet {
    print("item : \(item)") //순서가 없다.
}

//array, dictionary, tuple, set등이 가지고 있는 기몬 메소드 제공한다.
var myFriend : Set<String> = ["철수", "영희", "수지"]
if myFriend.contains("철수") {
    print("내 친구중에 철수가 있다")
}

//set안의 값을 찾아 삭제하고 싶다.
if let indexToFind = myFriend.firstIndex(of: "영희") {
    print("찾았다! :\(indexToFind)")
    myFriend.remove(at: indexToFind) //영희 삭제
}

print(myFriend) //영희가 삭제되고 철수 수지만 남는다.


