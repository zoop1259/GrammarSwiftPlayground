/*:
 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 
 ## forEach
Similar to a for...in loop, only it isn't a loop.
 */
/*:
 #### Simple Arrays
 */
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
/* Example 1: step through each element of the array to determine which ones are even */
/* use for in loop */
//for number in numbers {
//    //2의 배수
//    if number.isMultiple(of: 2) {
//        print("\(number)이다.")
//    } else {
//        print("\(number)이 아니다.")
//    }
//}

/* use forEach */
//numbers.forEach { (number) in
//    if number.isMultiple(of: 2) {
//        print("\(number)이다.")
//    } else {
//        print("\(number)이 아니다.")
//    }
//}

/* use shortcut and nil coalescing operator */
//shift를 누른상태로 더블클릭하면 다중 단어 선택이 가능하다.
numbers.forEach {
    $0.isMultiple(of: 2) ? print("\($0)이 맞다.") : print("\($0)이 아니다.")
}

/* Loop through the array and print out the squares of each number
   use a guard statement. */
let numbers2 = [1, 2, nil, 5, 6, nil, 7, 8, 9, nil]
/* use for in loop an */
//for number in numbers2 {
//    //nil값 없애고 곱하기
//    guard let number = number else {
//        continue
//    }
//    print("\(number) is \(number * number)")
//}

/* use forEach */
//numbers2.forEach { (number) in
//    guard let number = number else {
//        return
//    }
//    print("\(number) is \(number * number)")
//}

/* Using the index for an array
 print the index and all nil numbers in the numbers2 array */
/* 1. Use for...in loop and guard */
//nil값 찾기
for (index, number) in numbers2.enumerated() {
    guard let _ = number else {
        print("아이템 \(index) is nil")
        continue
    }
}

/* 2. Use forEach and guard */
numbers2.enumerated().forEach { (index, number) in
    guard let _ = number else {
        print("아이템 \(index) is nil")
        return
    }
}
/*:

 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 */
