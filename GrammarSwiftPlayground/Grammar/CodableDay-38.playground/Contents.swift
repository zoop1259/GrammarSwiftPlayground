import UIKit

let jsonFromServer = """
{
    "nick_name": "민대",
    "job": "무직, 취준생",
    "user_name": "min_dae",
}
"""

//de code = json = class 또는 struct로
//in code = json으로 만든다

struct User: Decodable {
    var nickname: String?
    var job: String
    var myUserName: String
    
    //내가 쓰고 싶은 변수명으로 바꿔주겠다.
    enum CodingKeys: String, CodingKey {
//        case nickname = "nick_name"
        case nickname = "nick_name2"
        case job
        case myUserName = "user_name"
    }
    
    static func getUserFromJson(_ jsonString: String) -> Self?  { //대문자 Self는 타입이 된다.
        guard let jsonData : Data = jsonString.data(using: .utf8) else { return nil }
            
        do {
            let user = try JSONDecoder().decode(User.self, from: jsonData)
            print("user: \(user)")
            return user
        } catch {
            print("에러 발생: \(error.localizedDescription)")
            return nil
        }
    }
}

let printuser = User.getUserFromJson(jsonFromServer)

