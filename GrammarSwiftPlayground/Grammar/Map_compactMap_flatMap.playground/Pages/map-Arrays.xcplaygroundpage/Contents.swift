/*:
 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)

 ## map
'map' loops over a collection and applies the same operation to each element in the collection.
*/
import Foundation
/*:
 ## Arrays
Consider this array of integers.  Produce an array that doubles each value
 1. Use a Lopp
 2. Use map
 */
//Use Map

let numbers = [1, 2, 3, 4, 5, 6]
//1. 루프
var doubleNumbers: [Int] = []
for number in numbers {
    doubleNumbers.append(number * 2)
}
doubleNumbers

//2. map 사용
var doubleNumbersMap = numbers.map { (number) -> Int in
    return number * 2
}
/*
이 상태에서 저 블럭에 맞추고 엔터를 누르면 클로저로 바뀐다...
var doubleNumbersMap = numbers.map(<#T##transform: (Int) throws -> T##(Int) throws -> T#>)
}
 이렇게...
 var doubleNumbersMap = numbers.map { <#Int#> in
     <#code#>
 }

*/

//2-1.
var doubleNumbersMap2 = numbers.map { (number) -> Int in
    number * 2
}

//2-2.
var doubleNumbersMap3 = numbers.map { (number) in
    number * 2
}

//2-3.
var doubleNumbersMap4 = numbers.map {
    $0 * 2
}

//complex array

let pairs = [[1,5], [7,9], [11,15]]
var sums = pairs.map { (pair) in
    pair[0] + pair[1]
}
sums //6,16,26

var sums2 = pairs.map { $0[0] + $0[1] }
sums2

//another array
let groups = [[1,3,9,11], [5,7]]
var groupSum = groups.map { (group) -> Int in
    var sum = 0
    for num in group {
        sum += num
    }
    return sum
}
groupSum

//any type array
let stringValues = ["1", "two", "3", "4", "five"]
let intValues = stringValues.map { (value) -> Int? in
    Int(value)
}
intValues

let intValues2 = stringValues.map { Int($0) }
intValues2
//nil을 제거한 배열을 얻고 싶다?

struct User {
    var name: String
    var age: Int
}

let users = [
    User(name: "나", age: 10),
    User(name: "너", age: 10),
    User(name: "나나", age: 20),
    User(name: "너너", age: 20)
]

let names = users.map { $0.name }
names

/*:

 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 */
