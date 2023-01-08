import UIKit

/*
 기본형태는 이런식..
 <>,[] 이걸 제네릭이라 부른다.
 [] >> 배열 형태의 제네릭
 제네릭 <T> , [T]
 struct MyArray<>
*/

protocol PetHaving {

    //assiciatedtype을 통해 제네릭으로 어떠한 자료형이든 가질 수 있다.
    associatedtype T
    
    var pets: [T] { get set }
    //mutating을 통해 스트럭트에서 멤버 변수 값 변경
    mutating func gotNewPet(_ newPet: T)
}

extension PetHaving {
    mutating func gotNewPet(_ newPet: T) {
        self.pets.append(newPet)
    }
}

enum Animal {
    case cat, dog, bird
}

struct Friend : PetHaving {
    var pets = [Animal]()
}

struct Family : PetHaving {
    var pets = [String]()
}

var myFriend = Friend()

myFriend.gotNewPet(Animal.bird)
myFriend.gotNewPet(Animal.cat)
myFriend.gotNewPet(Animal.dog)
myFriend.pets

var myFamily = Family()
myFamily.gotNewPet("거북")
myFamily.gotNewPet("토끼")
myFamily.gotNewPet("강쥐")
