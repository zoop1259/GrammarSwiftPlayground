/*:
  [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 # A Throwing Function
 functions or methods that might generate an error
 */
import Foundation

func validateCredentials(username: String, password: String) throws {
    // You might have some logic here that will check to see if
    // the username and/or password fullfill your requirements
    //당신이 여기서 확인할 수 있는 논리가 있을 수 있다. 사용자 이름 및/또는 비밀번호가 요구 사항을 충족합니다.
    //사용자 이름 및 비밀번호 요구사항을 확인해라?
    if username.count < 4 {
        throw CredentialErrors.badUserName
    }
    //패스워드를 확인할 최소한의 10진수의 개수가 하나인지 확인한다.
    if (password.rangeOfCharacter(from: NSCharacterSet.decimalDigits) == nil) {
        throw CredentialErrors.badPassword
    }
    print("passed")
    
}
//try validateCredentials(username: "damin", password: "pass")
//validateCredentials(username: "daeMin", password: "password") //이렇게만쓰면 try catch를 안써서 에러남.
/*:
 ## Error Enum
 Throwing functions can have an associated enum error
 */
//catch에 사용할 customError enum을 생성한다.
enum CredentialErrors: Error {
    case badUserName
    case badPassword
}

/*:
 ## Try
 Use in a do - try - catch block when you want to deal with specific types of errors
 */
//do {
//    try validateCredentials(username: "DaeMin", password: "pass")
//} catch {
//    switch error {
//    case CredentialErrors.badUserName:
//        print("이름이 잘못됨")
//    case CredentialErrors.badPassword:
//        print("비밀번호 입력이 안됨")
//    default:
//        break
//    }
//}

/*:
 ## Try?
 */
//if (try? validateCredentials(username: "dm", password: "pass1")) == nil {
//    print("실패")
//}

func login(username: String, password: String) {
    guard (try? validateCredentials(username: username, password: password)) != nil else {
        print("실패")
        return
    }
    print("성공")
    //carry on with login
}
//String으로 받지만 문자열만있으면 password는 실패한다. 숫자를 첨가해라.
//login(username: "DaeMin", password: "pass") //실패
login(username: "DaeMin", password: "pass1") //성공
/*:

[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
*/
