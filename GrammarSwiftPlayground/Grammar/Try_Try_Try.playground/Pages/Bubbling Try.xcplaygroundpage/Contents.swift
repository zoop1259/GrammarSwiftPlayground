/*:
 [< Previous](@previous)           [Home](Introduction)

 # Bubbling Try
Defer the catching of an error to the calling function

*/
//호출 함수에 대한 오류 수집 지연
import UIKit

let person2JSON = """
{
    "name": "James",
    "age": 45,
}
"""

class Person: ObservableObject, Decodable {
    enum CodingKeys: String, CodingKey {
        case name, age
    }
    var name: String
    @Published  var age: Int
    
    required init (from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            name = try container.decode(String.self, forKey: .name)
        } catch {
            fatalError("오류슈밤")
        }
        do {
            age = try container.decode(Int.self, forKey: .age)
        } catch {
            fatalError("오오류슈밤")
        }
        
    }
}

let decoder = JSONDecoder()
let person2JSONData = person2JSON.data(using: .utf8)!

var person: Person
do {
    person = try decoder.decode(Person.self, from: person2JSONData)
    print(person.name)
} catch {
    fatalError("오오오류슈밤")
}
//:  [< Previous](@previous)           [Home](Introduction)
