import UIKit

//예를들어 핸드폰번호를 010-0000-1111을 입력받았을때
//01000001111으로 받아낼 수 있게.

//첫번쨰방법
//replacingOccurrences(of: with:)
let phoneNumber = "010-0000-1111"
let filterNumber = phoneNumber.replacingOccurrences(of: "-", with: "")
//-를 없애서 새로운 문자열을 리턴해준다
//정의를 살펴보면
// func replacingOccurrences(of target: String, with replacement: String) -> String
print(filterNumber)

//이중으로도 사용해 보았다.
//허나 이렇게 사용하면 시간복잡도가 O(n)이므로 string이 길수록 상당히 비효율적이다.
let phoneNumber2 = "010-1111 0000"
let filterNumber2 = phoneNumber2.replacingOccurrences(of: "-",with:"").replacingOccurrences(of: " " , with: "")
print(filterNumber2)

//정규표현식으로 사용해보자 , .regularExpression
//예제 :     answer = answer.replacingOccurrences(of:"[^0-9a-z._-]",with:"", options: .regularExpression)
//이렇게하면 좀 더 효율적이다. of에 모든걸 묶어 사용하면 된다.
let filter = phoneNumber2.replacingOccurrences(of: "[ |-]", with: "", options: .regularExpression)
print(filter)



//두번쨰방법
//map 과 compactMap

//map의 정의
//func map<T>(_ transform: (Element) throws -> T) rethrows -> [T]
let arrNumber = ["1", "2", "three", "///4///", "5"]
let mapped: [Int?] = arrNumber.map { str in Int(str) }
print(mapped) // [1,2,nil,nil,5] // [Int?]라 옵셔널이다.

/*
 공식문서 예제
 let cast = ["Vivien", "Marlon", "Kim", "Karl"]
 let lowercaseNames = cast.map { $0.lowercased() }
 // 'lowercaseNames' == ["vivien", "marlon", "kim", "karl"]
 let letterCounts = cast.map { $0.count }
 // 'letterCounts' == [6, 6, 3, 4]
 */

//compactMap의 정의
//https://developer.apple.com/documentation/swift/array/2957701-compactmap
//func compactMap<ElementOfResult>((Element) -> ElementOfResult?) -> [ElementOfResult]
//시간복잡도는: O( m + n ), 여기서 n 은 이 시퀀스의 길이이고 m 은 결과의 길이입니다.
//변환이 선택적 값을 생성할 때 비선택적 값의 배열을 수신하려면 이 방법을 사용하십시오.
//ma
//nil이 시퀀스의 각 요소로 주어진 변환을 호출한 결과가 아닌 배열을 반환합니다 .
let compactMappped: [Int] = arrNumber.compactMap { str in Int(str) }
print(compactMappped) //[1,2,5]



//세번째방법
//filter
let filterStr = phoneNumber2.filter { $0.isNumber }
print(filterStr)




/*
 
 func flatMap<SegmentOfResult>((Element) -> SegmentOfResult) -> [SegmentOfResult.Element]
 이 시퀀스의 각 요소를 사용하여 지정된 변환을 호출한 연결된 결과를 포함하는 배열을 반환합니다.
 func reduce<Result>(Result, (Result, Element) -> Result) -> Result
 주어진 클로저를 사용하여 시퀀스의 요소를 결합한 결과를 반환합니다.
 func reduce<Result>(into: Result, (inout Result, Element) -> ()) -> Result
 주어진 클로저를 사용하여 시퀀스의 요소를 결합한 결과를 반환합니다.
 */
