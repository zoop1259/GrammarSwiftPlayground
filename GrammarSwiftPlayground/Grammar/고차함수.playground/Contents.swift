import UIKit

//매개변수로 받은 함수 혹은 클로저를 받고 받았던 녀석을 반환하는 함수
//콜렉션에 들어가는 array, dictionary, set에 사용됨
//Sorted, Map, Filter, Reduce등이 빌트인 되어있다.

func getName(_ name: String) -> String {
    return "내 이름은 \(name)"
}

var getNameClosure : (String) -> String

func sayHello( getName: (String) -> String, name: String) -> String {
    return getName(name)
}

let resultOne = sayHello(getName: getName(_:), name: "호롤롤로")

//int로 되어있는 배열
let numbers = [3, 7, -4, 9, 10, 1]

//map을 통해 string배열로 변환 할 것이다.
//aNumber를 통해 numbers를 하나씩 불러온다.
let stringNumbers : [String] = numbers.map { (aNumber: Int) -> String in
    return "\(aNumber) 입니다."
}

//filter를 통해 짝수만 불러올 것이다.
//anumber가 하나씩 불러와서 2로 나눠 나머지가 0이면 evennumber에 넣는다.
let evenNumbers : [Int] = numbers.filter{ aNumber in
    return aNumber % 2 == 0
}

//sort , sorted

var myArray = [3, 101, 98, 21, 90, 2137, 123,  0 ,1]

//오름차순이다. 낮은수부터
var orderedArray = myArray.sorted()
//sorted는 배열을 정렬해서 '반환'한다.

//sort는 자체가 변하는 것이다.
myArray.sort()

//내림차순은 sorted(by:>)
//sort(by:>)


