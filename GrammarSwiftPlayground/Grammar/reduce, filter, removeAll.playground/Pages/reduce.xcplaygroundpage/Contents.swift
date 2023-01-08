/*:
 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)

 ## reduce
Use reduce to combine all items in a collection to create a single new value
*/
import Foundation
/*:
Sum the total of numbers in an array of Integers
 */
let numbers = [1, 2, 3, 4, 5, 6]
/* Use Loop */
var sum = 0
for number in numbers {
    sum += number
}
sum //21

/* Use reduce */
//let sum2 = numbers.reduce(Result) { partialResult, <#Int#> in
//    <#code#>
//}
//0부터 더해야하므로 result를 0으로
let sum2 = numbers.reduce(0) { (currentSum, number) in
    currentSum + number
}
sum2

/* Reduce version */
let sum3 = numbers.reduce(0) { $0 + $1 }
sum3

/* Reduce version 2 */
let sum4 = numbers.reduce(0,+)

/*:
Find the product of numbers in an array of Integers
 */
//정수 배열에서 숫자의 곱 찾기
//0부터 곱하면 0이기 떄문에 1부터 시작.
let product = numbers.reduce(1, *)
product

/*:
Find the sum of all integers in the following array of arrays
 */
//크기가 각각다른 배열은!?
let numberGroups = [[2, 6, 8, 10], [18, 5, 11], [5, 15, 8, 11,18]]
//flatMap 이용.
let groupSum = numberGroups.flatMap { $0 }.reduce(0, +)

/*:
Sum the values of a double property of a struct
 */
/* Find the total amount of salary paid */
struct Employee {
    var name: String
    var salary: Double
}
let employees = [
    Employee(name: "Mary", salary: 100_110),
    Employee(name: "Jack", salary: 50_000),
    Employee(name: "Sally", salary: 75_500),
    Employee(name: "Fred", salary: 48_900)
]
/* Use full expansion */
let totalSalary = employees.reduce(0) { (currentTotal, employee) -> Double in
    currentTotal + employee.salary
}
totalSalary
/* user shorthand arguments */
let totalSalary2 = employees.reduce(0) { $0 + $1.salary}
totalSalary2

/*:
Reduce and Dictionaries
 */
let employeeDict = ["Mary" : 100_000, "Jack": 50_000, "Sally": 75_500, "Fred":48_900]
/* Use full expansion */
let salaryValue = employeeDict.reduce(0) { partialResult, salaryTuple in
    partialResult + salaryTuple.value
}
salaryValue

/* use shorthand arguments */
let salaryValue2 = employeeDict.reduce(0) { $0 + $1.value }
salaryValue2

/* reduce the dictionary to a string containing all names, separated by a space */
//string은 이런식으로 (key값은 string이니까)
let names = employeeDict.reduce("") { $0 + $1.key + " " }
names
/*:
Reduce and Sets
 */
let weights: Set = [98.5, 102.7, 100.2, 88.4]
/*  Find the sum of all weights in this set. */
let totalWeights = weights.reduce(0,+)
totalWeights

/* User Reduce to find the total of all weights over 100.0 */
let heavyWieghts = weights.reduce(0) { (currentTotal, weight) -> Double in
    if weight > 100 {
        return currentTotal + weight
    } else {
        return currentTotal
    }
}
heavyWieghts

/* Condense the body using a nil coallessor */
let heavyWieghts2 = weights.reduce(0) { (currentTotal, weight) -> Double in
    weight > 100 ? (currentTotal + weight) : currentTotal
}
heavyWieghts2

/* Use shorthand arguments */
let heavyWieghts3 = weights.reduce(0) { $1 > 100 ? ($0 + $1) : $0 }
heavyWieghts3


/*:

 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 */
