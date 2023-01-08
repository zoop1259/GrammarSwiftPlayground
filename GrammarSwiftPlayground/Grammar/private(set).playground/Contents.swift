import UIKit

//구조체 자체를 집으로 보자.
struct MyPet {
    
    //방처럼 공개해 놓은거라고 생각하자.
    //private가 없으면 public이라고 생각하면 좋다.
    var title :String = "타이틀없음"
    
    //private는 집안의 금고처럼 감춰둔거라고 생각하자.
    //사용은 가능하지만 값 변경은 불가능.
    private (set) var name : String = "이름없음"
    
    //Class는 사용하지 않지만 구조체에서 값을 변경하려면 mutating을 써야한다.
    mutating func setName(to newName: String) {
        self.name = newName
    }
}

var myPet = MyPet()
myPet.name
myPet.title
myPet.title = "우리집"
myPet.title

//Cannot assign to property: 'name' setter is inaccessible
//변경 불가능하다.
//myPet.name = "강대민"
//당연히 접근은 가능
myPet.name

