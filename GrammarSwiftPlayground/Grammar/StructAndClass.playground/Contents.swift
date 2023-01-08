import UIKit

class Person {
    var name: String = "안녕1"
    var age: Int = 0
}

struct Persons {
    var name: String = "안녕2"
}

func prints() {
    
    let person = Person()
    var a = person.name
}

let person = Person()
//이렇게 클래스에서 참조되면 같이 변경된다.
var person1 = person
person1.name = "안녕1못해"
print(person.name, person1.name)
//var b = person.name
//person.name = "ㄴㅏㄷㅏ"
//print(b)
//print(person.name)
//b = "나다2"
//print(b)
//print(person.name)



//그러나 구조체에서는!?
let persons = Persons()
var persons1 = persons
persons1.name = "안녕2못해"
print(persons.name, persons1.name)
//변경이 되지 않는다. 참조만 하기 때문이다.

//var c = persons.name
//persons.name = "안녕욤"
//print(c)
//print(persons.name)
//c = "안녕욤2"
//print(c)
//print(persons.name)

