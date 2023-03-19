import UIKit

// 값 -> 스택 (스택은 구조상 한방향으로 데이터를 넣고 빼는 단순한 구조라 빠르다.)
// 참조 -> 힙 (힙은 적절한 메모리 공간이 있는지 확인한 후에 할당을 처리하는 동적 구조. 그래서 스택보다 오버헤드가 많이 발생한다.)
//그러므로 좋은 성능의 코드는 값 타입을 많이 사용하는것이 좋다.

//String의 경우 구성하는 문자들은 Character타입이라 힙 영역에 간접적으로 저장된다.
//그래서 구조체를 만들어 사용하면 좋다.
enum Emotion { case happy, sad, angry }
enum Species { case human, bear, dragon }
var cachedEmoji = [String: UIImage]()

//아래는 힙영역을 사용하게 된다.
//func generateEmoji(_ emotion: Emotion, _ species: Species) -> String {
//    let key = "\(emotion):\(species)"
//    return key
//}

//이렇게 구조체로 만들어서 직접 대입해주면 스택 영역이 된다.
struct Attributes: Hashable {
    var emotion: Emotion
    var species: Species
}

func generateEmoji(_ emotion: Emotion, _ species: Species) -> String {
    let key = Attributes(emotion: emotion, species: species)
    return key
}


print("------------------- Value Types --------------------")
/**
 값 타입은 스택 영역에 저장되는 타입, 메모리에 할당된 값 타입의 데이터를 다른 변수 또는 상수에 복사하면, 각각의 인스턴스는 데이터의 유일한 복사값을 가지게 된다.
 복사된 인스턴스의 값을 수정해도 기존의 인스턴스에는 영향을 주지 않는다.
 
 값타입의 종류
 struct, enum
 Int, Double, String과 같은 기초 타입(Fundamental types)
 Array, Set, Dictionary와 같은 컬렉션 타입
 값 타입만으로 구성된 tuple
 
 스위프트의 포준 라이브러리 값 타입은 enum을 제외한 모든 타입이 struct로 구현되어 있다.
 */
struct Point {
    var x : Int
    var y : Int
}

var a = Point(x: 0, y: 0)
var b = a
b.x += 10
print(a,b)

print("------------------- Reference Types --------------------")
/**
 메모리의 힙 영역에 저장되고 이 데이터를 가리키는 주소값을 스택영역에 저장된다. (aa,bb를 프린트하면 struct의 a,b 와는 다르게 출력된다.)
 데이터를 참조하여 사용하기 때문에 값 타입과 달리 데이터를 변수에 할당하거나 함수에 전달할 때 값을 복사하지 않고 참조값을 사용한다.
 그래서 bb에서 변경하면 aa에도 영향이 간다.
 
 참조타입의 종류는
 class와 closure가 있다.
 */
class cPoint {
    var x : Int = 0
    var y : Int = 0
}

let aa = cPoint()
let bb = aa
bb.x += 10
print(aa, bb)
print(aa.x, bb.x)

print("------------------- Copy-on-Wirte --------------------")
//UnsafeRawPointer는 메모리의 데이터에 접근할 수 있는 포인터
var array1: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
print(UnsafeRawPointer(array1)) // 0x0000600002a3d8a0

var array2 = array1
print(UnsafeRawPointer(array2)) // 0x0000600002a3d8a0

array2.removeLast() // Copy-on-Write (간단하게 COW라고도 함.)
print(UnsafeRawPointer(array1)) // 0x0000600002a3d8a0
//이렇게 값이 변경되면 주소가 바뀌게 된다. ( 참조를 끊고 다른 메모리 공간을 할당.)
print(UnsafeRawPointer(array2)) // 0x0000600002a359f0

print("------------------- 값 타입 안의 참조 타입? --------------------")
class HighSchool: CustomStringConvertible {
    var description: String {
        return "\(name) High School"
    }

    var name: String

    init(name: String) {
        self.name = name
    }
}

struct Student {
    var highSchool: HighSchool
}

let swiftHighSchool = HighSchool(name: "Swift")

let student1 = Student(highSchool: swiftHighSchool)
let student2 = Student(highSchool: swiftHighSchool)

student2.highSchool.name = "Next"

//동일한 이유는 참조 타입인 클래스는 할당 시 값을 복사하지 않고, 주소값을 전달하여 참조를 통해 값에 접근하기 때문
print(student1.highSchool) // Next High School
print(student2.highSchool) // Next High School

print("------------------- 참조 타입 안에서의 값 타입 --------------------")

struct Company {
    var name: String
}

class Product {
    var name: String
    var company: Company

    init(name: String, company: Company) {
        self.name = name
        self.company = company
    }
}

let apple = Company(name: "Apple")

let iPhone = Product(name: "iPhone12", company: apple)
let macbookAir = Product(name: "Macbook Air", company: apple)

macbookAir.company.name = "Microsoft"

//값 타입인 구조체는 할당 시 값을 복사하여 유일한 값을 가지기 때문.
print(iPhone.company.name)     // Apple
print(macbookAir.company.name) // Microsoft

