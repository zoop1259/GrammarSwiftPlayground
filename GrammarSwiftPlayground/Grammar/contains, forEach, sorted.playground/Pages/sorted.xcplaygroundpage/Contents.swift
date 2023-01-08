/*:
 [< Previous](@previous)           [Home](Introduction)

 ## sorted
 Use sorted to sort collection data using the given predicate as the comparison between elements.

*/
/*:
 #### Arrays
 */
/* Sort this array */
var numbers = [10, 5, 2, 8, 3, 9, 4, 1, 7, 6]
var sortedNumbers = numbers.sorted()
sortedNumbers
/* reverse sort */
var reversSorted = numbers.sorted { (num1, num2) in
    num1 > num2
}
reversSorted

/* Use shortcut argument*/
var reversSorted2 = numbers.sorted { $0 > $1 }
reversSorted2
/* Shorter yet */
var shortSorted = numbers.sorted(by: >)
shortSorted

/* Example 2: Arrays of Objects */
struct Person {
    var name: String
    var age: Int
}
var people = [
    Person(name: "Moe", age: 12),
    Person(name: "Larry", age: 22),
    Person(name: "Shemp", age: 25),
    Person(name: "Curly", age: 16)
]
/* Sort by name */
var sortedPeople = people.sorted { p1, p2 in
    p1.name < p2.name
}
sortedPeople

/* Sort by age using shortcut argument */
let sortedPeopleByAge = people.sorted { $0.age > $1.age }
sortedPeopleByAge

/* Example 3: Make the struct Comparable so you can sort by
   name without having to specify property in sorted */
struct Employee: Comparable {
    //comparable을 사용하려면 준수해야함.
    static func < (lhs: Employee, rhs: Employee) -> Bool {
        lhs.name < rhs.name
    }
    //다른조건도 추가할수있지만 너무 복잡하게 하지말아라.
    static func > (lhs: Employee, rhs: Employee) -> Bool {
        lhs.salary > rhs.salary
    }
    
    var name: String
    var salary: Double
}
var employees = [
    Employee(name: "Moe", salary: 100_000),
    Employee(name: "Larry", salary: 88_500),
    Employee(name: "Shemp", salary: 125_500),
    Employee(name: "Curly", salary: 96_900)
]
let sortedNames = employees.sorted()
sortedNames

let sortedSalaries = employees.sorted(by: >)
sortedSalaries
///* How about a shorthand reverse sort on salary */

/*:
 #### Dictionaries
 */
let peopleDict = ["Curly": 16, "Larry": 22, "Moe": 12, "Shemp": 25]
/* sort by keys (names)*/
let sortedPeopleByNameDict = peopleDict.sorted { p1, p2 in
    p1.key < p2.key
}
sortedPeopleByNameDict
/* use shorthand arguments */
let sortedShortByNameDict = peopleDict.sorted { $0.key < $1.key }
sortedShortByNameDict

/*  sort by values (age) */
let sortedPeopleByAgeDict = peopleDict.sorted { $0.value > $1.value }
sortedPeopleByAgeDict
/*:

[< Previous](@previous)           [Home](Introduction)
*/

