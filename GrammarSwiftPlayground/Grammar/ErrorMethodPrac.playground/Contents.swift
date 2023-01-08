import UIKit

//자료형이 error인 enum
enum MissmatchError: Error {
    case nameMissmatch
}

func guessMyName(name userInput: String)
//throws를 통해 에러를 밖으로 던진다.
throws {
    //매개변수로 받은 이름이 일치하지 않으면?
    if ( userInput != "강대민") {
        //nameMissmatch를 던진다.
        throw MissmatchError.nameMissmatch
    }
}

//do catch 를 이용해 외부로 던져진? 에러를 잡아 에러 처리가 가능함.
do {
    try guessMyName(name: "대민강")
    print("정탑입니다!")
} catch {
    //나중에 어느 부분에서 에러가 발생했는지 알 수 있다.
    print("에러 : \(error)")
}
