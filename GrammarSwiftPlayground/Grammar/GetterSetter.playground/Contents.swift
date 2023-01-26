import UIKit

//가져올떄getter 설정할떄setter

class Friend {
    var name: String
    var age: Int
    
    //세터는
    var detailInfo : String = ""
    
    //게터는 데이터를 가공을해서 가져올 수 있다.
    //get만 사용가능, get + set 사용가능, set만 사용 불 가 능
    var nickName : String {
        get {
            return "내 친구: \(name) 나이는 : \(age)"
        }
        set {
            detailInfo = "info에서 설정됨: " + newValue
        }
    }
    
    init(_ name: String,_ age: Int) {
        self.name = name
        self.age = age
    }
    
}

let myFriend = Friend("정대리", 31)
myFriend.nickName
myFriend.nickName = "호롤롤로"
myFriend.detailInfo
