/*:
 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)

 ## contains
Use contains to dtermine if an array contains an element or not.
*/
import Foundation

let numbers = [107, 86, 51, 74, 91, 184, 68]
/*:
 ### Single element use contains(element: )
 Ex. Does this array contain the value 74
 */
//74가 들어갔는지 확인하기
let found74 = numbers.contains(74) // true
let found99 = numbers.contains(99) // false
/*:
 ### Checking where criteria ia not unique
 Ex.  Does the array contain a multiple of 7?
 */
/* Use Loop */
var foundIt = false
for number in numbers {
    if number.isMultiple(of: 7) {
        foundIt = true
        break
    }
}
foundIt
/* Use contains */
var foundIt2 = numbers.contains { (number) -> Bool in
    //arr.append(number)
    number.isMultiple(of: 7) //5times?
}
foundIt2
/* Use shortcut argument */
var foundIt3 = numbers.contains { $0.isMultiple(of: 7) }
foundIt3

/*:
Do any employees make less than minium wage? ($15/hr)
 */
/* Do any employees make < $15/hr */
struct Employee {
    var name: String
    var hourlyWage: Double
}
//이름과 임금
let employees = [
    Employee(name: "Mary", hourlyWage: 22.50),
    Employee(name: "Jack", hourlyWage: 17.50),
    Employee(name: "Sally", hourlyWage: 22.90),
    Employee(name: "Fred", hourlyWage: 12.50)
]
/* Use full expansion */
let needsRaise = employees.contains { (employee) in
    employee.hourlyWage < 15
}
needsRaise
/* user shorthand arguments */
let needsRaise2 = employees.contains { $0.hourlyWage < 15 }
needsRaise2

/*:
Contains and Dictionaries
 */
let employeeDict = ["Mary" : 22.50, "Jack": 17.50, "Sally": 22.90, "Fred":12.50]
/* Use full expansion */
let emplyeesNeedRaise = employeeDict.contains { (employee) in
    employee.value < 15
}
emplyeesNeedRaise

/*:
Contains and Sets
 */
let weights: Set = [98.5, 102.7, 100.2, 88.4]
/*  Find if any weight in he set exceeds 110. */
let overWeights = weights.contains { (weight) in //사실 영상에선 -> Bool in 이지만 자동으로 bool로 인식하는듯.
    weight > 110
}
overWeights

/* Use shorthand */
let overWeights2 = weights.contains { $0 > 110 }
overWeights2

/*:
 #### Contains and strings
 Does this sentence contain the word dog?
 */
//문자열은 어떻게 찾을것인가.
let sentence = "The quick brown fox, jumped over the lazy Dog. And this is what he found"
/* Does the sentence contain 'dog'? */
let foundDog = sentence.contains("dog")
foundDog //false가 나온다. 이렇게 하면 Dog를 dog로 인식하지 못하기 떄문
let foundDog2 = sentence.lowercased().contains("dog")
foundDog2 //대소문자 구분해주어야 인식한다.

/* Does the sentence contain the word 'own' */
let foundOwn = sentence.contains("own")
foundOwn //이건 true다 왜냐하면 brown의 own을 인식하기 때문. 이 방법을 해결하기 위해선
//배열을 사용해야한다. 바로 for each

/*:

 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 */
