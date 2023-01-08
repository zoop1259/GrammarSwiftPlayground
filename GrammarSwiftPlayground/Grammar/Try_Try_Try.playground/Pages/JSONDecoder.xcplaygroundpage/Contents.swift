/*:
 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)

 # Decodable

*/
import UIKit

let person1JSON = """
{
    "name": "James",
    "age": 45,
}
"""


struct Person: Decodable {
    var name: String
    var age: Int
}

let decoder = JSONDecoder()
let person1JSONData = person1JSON.data(using: .utf8)!
//이게 에러가 뜨는이유
//let person = decoder.decode(Person.self, from: person1JSONData)
//func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable // throws를 해결 안해서.

//Try!

let person = try! decoder.decode(Person.self, from: person1JSONData)
print(person.name)
/*:
 ## do try catch
 */
do {
    let person = try decoder.decode(Person.self, from: person1JSONData)
    print(person.name)
} catch {
    print(error.localizedDescription)
}


/*:
 ## Try?
 */
let person2 = try? decoder.decode(Person.self, from: person1JSONData)
if let person2 = person2 {
    print(person2.name)
} else {
    print("실패")
}

//Alternative
print(person2?.name ?? "실패")

/*:

 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 */
