 import UIKit
/*:
 ### Simple Objects
 */
let person1JSON = """
{
    "name": "James",
    "age": 45,
    "gender": "Male",
    "sign": "Sagitarius",
    "partner": "Emily",
    "isEmployed": true
}
"""

let person2JSON = """
{
    "name": "Mary",
    "age": 45,
    "gender": "Female",
    "sign": "Taurus",
    "isEmployed": false
}
"""
//두번째 데이터에는 파트너의 값이 누락되어 있다.

struct Person: Decodable{
    let name: String
    let age: Int
    let gender: String
    let sign: String
    let partner: String? // person2JSON에는 값이 없어 옵셔널로 처리해야한다.
    let isEmployed: Bool
}

let decoder =  JSONDecoder()
let person1JSONData = person1JSON.data(using: .utf8)! // 유니코드인코딩작업.
//데이터의 디코딩 절차가 실패 할 수 있으므로 try를 사용해 주어야 한다. try?라면 do catch를 사용하여 에러처리를 해야하지만 이 데이터를 양호하다고 가정하고 그냥 try!를 사용한다.
let person1 = try! decoder.decode(Person.self, from: person1JSONData) // Person을 디코드하고싶다. person1JSON으로부터
print(person1.name)
print(person1.partner)
 
 let person2JSONData = person2JSON.data(using: .utf8)!
 let person2 = try! decoder.decode(Person.self, from: person2JSONData) // Person을 디코드하고싶다. person1JSON으로부터
 print(person2.name)
 print(person2.partner)
/*:
 ### Arrays
*/
let personsJSON = """
[
    {
        "name": "James",
        "age": 45,
        "gender": "Male",
        "sign": "Sagitarius",
        "partner": "Emily",
        "isEmployed": true
    },
    {
        "name": "Mary",
        "age": 45,
        "gender": "Female",
        "sign": "Taurus",
        "isEmployed": false
    }
]
"""

let personsJSONData = personsJSON.data(using: .utf8)!

/*:
 #### More Complex Objects
 */
let familyJSON = """
{
    "familyName": "Smith",
    "members": [
        {
            "name": "James",
            "age": 45,
            "gender": "Male",
            "sign": "Sagitarius",
            "partner": "Emily",
            "isEmployed": true
        },
        {
            "name": "Mary",
            "age": 45,
            "gender": "Female",
            "sign": "Taurus",
            "isEmployed": false
        }
    ]
}
"""

//MARK: - II
/*:
 ## A Better model
 */

/*:

 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 */
