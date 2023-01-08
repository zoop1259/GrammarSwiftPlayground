import UIKit

//구조체도 메서드를 가질 수 있고
//멤버변수들 활용이 가능하다.
struct Name {
    
    var lastname : String
    var firstname : String
    
    //풀네임을 가져오는 메소드
    func Fullname() -> String {
        return lastname + " " + firstname
    }
}

//메소드 사용하여 값 입력하기.
var myName = Name(lastname: "강", firstname: "대민")

//메소드 확인
print(myName.Fullname())
