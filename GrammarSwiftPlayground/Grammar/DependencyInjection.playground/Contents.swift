import UIKit

//의존성주입

//프로토콜은 약속이다.
//무언가를 강제한다.
//Talking을 상속한다면 안에있는것들을 준수해야한다.
protocol Talking {
    //Talking을 상속한ㄷ면 sayHi함수를 사용해야 한다.
    func sayHi()
    
    //만약 변수로 사용한다면?
    //값을 가져올수도있고 쓸수도있게 만든다.
    var saying: String { get set }
}

//이렇게만쓰면 에러가 발생한다. 왜 sayHi를 안쓰냐.
//class BestTalk: Talking {}

class BestTalk: Talking {
    var saying: String = "베스트 토크의 saying"
    
    func sayHi() {
        print("안녕안녕")
    }
}

class OldTalk: Talking {
    var saying: String = "올드 토크!"
    
    func sayHi() {
        print("오랜만이야")
    }
}

class ChangeTalk: Talking {
    var saying: String = "변경"
    
    func sayHi() {
        print("변경됐다임마")
    }
}

class Friend {
    //이거 자체가 의존성이 있다고 보자.
    var talkProvider: Talking
    var saying: String {
        get {
            talkProvider.saying
        }
    }
    
    //호출할떄 이름 안써줘도 되게 _ 사용
    init(_ talkProvider: Talking) {
        self.talkProvider = talkProvider
    }
    
    //만약 생성자의 프로바이더를 바꾸고 싶다면?
    func setTalkProvider(_ newProvider: Talking) {
        self.talkProvider = newProvider
    }
    
    func sayHi() {
        //외부에서 주입이된. 세이하이를 호출
        talkProvider.sayHi()
    }
}

let myBestFriend = Friend(BestTalk())

myBestFriend.sayHi()
myBestFriend.saying

let myOldFriend = Friend(OldTalk())

myOldFriend.sayHi()
myOldFriend.saying

myOldFriend.setTalkProvider(ChangeTalk())
myOldFriend.sayHi()
myOldFriend.saying
