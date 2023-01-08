import UIKit

let split1 = "12345".split(separator: "2")
print(split1)

let components1 = "12345".components(separatedBy: "2")
//값을 넣고 실행하면 속한 문자열을 제거한 배열로 '반환'
print(components1)

let joined1 = ["1","234","5"].joined()
//문자열 배열을 하나의 문자열로 만들어줌.
print(joined1)
//아래는 결과가 joined와 똑같다.
let joined2 = ["1","234","5"].compactMap{$0}
print(joined2)

let joinedseparated1 = ["1","234","5"].joined(separator: " ")
print(joinedseparated1)

//https://ios-development.tistory.com/377

