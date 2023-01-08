/*:
 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 
 ## filter
Use filter to loop over a collection and return a collection containing only those elements that match an include condition.
 */
/*:
 #### Simple Arrays
 */
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
/* Example 1: Filter this array to return another array of integers keeping only values that are less than or equal to 5
   Use for...in loop */
var newNumbers: [Int] = []
for number in numbers {
    if number <= 5 {
        newNumbers.append(number)
    }
}
newNumbers

/* use Filter */
let newNumbers2 = numbers.filter { (number) -> Bool in
//    if number <= 5 {
//        return true
//    } else {
//        return false
//    }
    //더 축약
    number <= 5
}
newNumbers2

/* use shorthand */
let newNumbers3 = numbers.filter { $0 <= 5 }
newNumbers3

/* Example 2: Filter this array to return another array of Strings beginning with the letter 'a' or 'A' */
//a 나 A로 시작하는 배열의 string을 출력
let names = ["Alice", "Bert", "Allen", "Samantha", "Ted", "albert"]
//let aNames = names.filter { $0.prefix(1) == "A" } //이렇게하면 A만 걸러냄
let aNames = names.filter { $0.uppercased().prefix(1) == "A" }
aNames

/* Example 3: Find the First person who matches the conditions above */
let firstAName = names.filter { $0.uppercased().prefix(1) == "A" }.first
firstAName //a로 시작하는 첫번쨰놈 출력
/*:
#### Arrays of Objects
*/
struct Person {
    var name: String
    var age: Int
}
let people = [
    Person(name: "Curly", age: 16),
    Person(name: "Larry", age: 22),
    Person(name: "Moe", age: 12),
    Person(name: "Shemp", age: 25)
]
/* Example 1:  Get an array of people who are adults (age >= 19) */
let adults = people.filter { (person) -> Bool in
    person.age >= 19
}
adults

/* Example 2: Get an array of people who are older than 20 with names beginning with 'M' */
//20살 이상이고 M으로 시작하는 사람 찾기
let spacialPeople = people.filter { $0.age > 20 && $0.name.prefix(1) == "M" }
spacialPeople

/* Example 3: Get an array of names of children (age < 19)
   Hint: Combine filter with map */
//19살 미만인 people의 이름만 mapping.
let children = people.filter { $0.age > 19 }.map { $0.name }
children
/*:
#### Dictionaries
*/
let peopleDict = ["Curly": 16, "Larry": 22, "Moe": 12, "Shemp": 25]
/* Filter to return a dictionary where the values are >= 19 */
let adultDict = peopleDict.filter { (person) -> Bool in
    person.value >= 19
}
adultDict

/* Shorthand version */
let adultDict2 = peopleDict.filter { $0.value >= 19 }
adultDict2
/*:
#### Sets
*/
let weights: Set = [98.5, 102.7, 100.2, 88.4]
/* Generate a set of weights where the values are < 100 */
let lightWeights = weights.filter { $0 < 100 }
lightWeights
/*:
 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 */
