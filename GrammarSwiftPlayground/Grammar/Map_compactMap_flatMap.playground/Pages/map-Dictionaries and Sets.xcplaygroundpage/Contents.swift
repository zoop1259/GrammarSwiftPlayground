/*:
 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 
 ## map-Dictionaries and Sets
 Consider the following Dictionary and map it to a new dictionary that will provide the corresponding average temparatures in Fahrenheit
 */
let tempAvgC: [String: Double] = ["Spring" : 13, "Summer" : 22, "Fall" : 14, "Winter" : 7 ]
let tempAvgF = tempAvgC.map { (season, temp) in
    [season: temp * 9 / 5 + 32]
}
tempAvgF

//바로가기인수? 를 사용
let tempAvgF2 = tempAvgC.map { [$0:$1 * 9 / 5 + 32] }
tempAvgF2

/*:
Consider this dictionary and map it to create an array of Users
 */
let dataDict:[String: Int] = ["Curly" : 18, "Larry": 22, "Moe" : 7]

struct User {
    var name: String
    var age: Int
}

var users = dataDict.map { (key, value) -> User in
    User(name: key, age: value)
}
users

var users2 = dataDict.map { User(name: $0, age: $1) }
users2
/*:
 #### Sets
 Map this set of Fahrenheit temperatures to a set of equivalent temperatures in Celsius
 */
let fahrTemps: Set = [-40, 0, 32, 90, 212]
let celsTemps = fahrTemps.map { ($0 - 32) * 5 / 9 }
celsTemps //이건 그냥 [Int]형이라 내가 원하는 결과가 아니다.

let celsTemps2 = Set(fahrTemps.map { ($0 - 32) * 5 / 9 })
celsTemps2 //Set<Int>
/*:
 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 */
