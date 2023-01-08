import UIKit
/*
func doSomething() {
    var message = "Hi i am sodeul!"
 
    //클로저 범위 시작
    
    var num = 10
    let number = 20
    //익명함수는 외부 변수상수를 사용할 수 없음.
    /*
     closure란 익명함수는,
     클로저 내부에서 외부 변수인 num이라는 변수를 사용(print)하기 때문에
     num의 값을 클로저 내부적으로 저장하고 있는데,
     이것을 클로저에 의해 num의 값이 캡쳐 되었다 라고 표현함

     message란 변수는 클로저 내부에서 사용하지 않기 때문에
     클로저에 의해 값이 캡쳐되지 않음!
     */
    let closure = { print("이것은 num: ",num, "이것은 number: ",number) }
    /*
     Closure는 값을 캡쳐할 때
     Value/Reference 타입에 관계 없이 Reference Capture 한다

     음 이게 무슨 말이냐면,
     아까 num이란 변수를 클로저 내부적으로 저장한다고 했잖음?
     근데 num은 Int 타입의 구조체 형식이고, 이는 곧 Value 타입이기 때문에,
     값을 복사해서 들고 저장해야 되는 것이 일반적임!!!!
     (구조체는 복사하고)
     (클래스는 참조!)
     그러나, 클로저는 Value/Reference 타입에 관계없이 캡쳐하는 값들을 참조함!!
     이것을 Reference Capture라고 함
     */
    let simple = { print("하이")}
    //클로저 범위 끝
    print(closure) //function
    print(closure()) // 0,0
    print(message)
}

//doSomething()


func doSomething2() {
    var num: Int = 0
    print("num check #1 = \(num)")
    
    let closure = {
        print("num check #3 = \(num)")
    }
    
    //값 변경전
    print("num check #1.5 = ", closure())
    
    num = 20
    print("num check #2 = \(num)")
    //값 변경후
    closure()
//    따라서, closure를 실행하기 전에 num이란 값을 외부에서 변경하면, 클로저 내부에서 사용하는 num의 값 또한 변경 됨!
}

//doSomething2()


func doSomething3() {
    var num: Int = 0
    print("num check #1 = \(num)")
 
    //클로저헤드와 클로저바디로 구분짓고 바디를 구분짓는 in을 사용하여 값을 출력하면 변경된값이 클로저 안에선 먹히지 않는다.
    //대신 num은 let으로 클로저 내부에서 값 변경이 불가능하다.
    let closure = { [num] in
        print("num check #3 = \(num)")
//        Cannot assign to value: 'num' is an immutable capture
        //        num = 5
    }
    
    num = 20
    print("num check #2 = \(num)")
    closure()
}

//doSomething3()





//func dosomething(closure: @escaping () -> Void) {
//
//    var a = 0
//
//    print("함수 시작")
//
//    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//        a = 1
//        print(a)
//        closure()
//    }
//    print("함수 끝")
//    print(a)
//}
//
////dosomething {
////    print()
////}
//
//func nosomething(closure: () -> Void) {
//
//    var b = 0
//
//    print("함수시작")
//
//    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//        b = 1
//        print(b)
//        closure()
//    }
//
//    print("함수끝")
//    print(b)
//
//}


//var a = ""
//var aa = ""
//func hi() {
//    let hi = "hi"
//    a = hi
//    print(a)
//}
//print("안녕")
////함수외부에서 사용불가
//print(a)
//
//func copyhi() {
//    print(a)
//}
//copyhi()
////플레이그라운드에선 이렇게 사용하면 값을 넣을 수 있기는 하네
//hi()
//print(a)
////여전히 외부함수에선 출력불가
//copyhi()
//
//
//func hihi(complition: @escaping(String) -> ()) {
//    complition("하이")
//}






//var aget = false

//이렇게 하면 외부에서 complition이 트루인지 알 수가 없다.
//func agetData(complition:  ((Bool) -> Void)) {
//    complition(true)
//}

//그래서 이스케이핑을 쓴다.
//func getData(complition: @escaping ((Bool) -> Void)) {
//    let task = URLSession.shared.dataTask(with: URL(string: "")!) { data, response, error in
//
////        guard let data = data else {
//        guard data != nil else {
//            complition(false)
//            return
//        }
//        complition(true)
//    }
//    task.resume()
//}
//
//final class APICaller {
//    var isReady = false
//
//
//    func warmup() {
//        isReady = true
//
//        if !completionhandler.isEmpty {
//            completionhandler.forEach({ $0() })
//            completionhandler.removeAll()
//        }
//    }
//
//    var completionhandler = [(() -> Void)]()
//
//    //escaping을 사용하지 않으면 Escaping closure captures non-escaping parameter 'complition' 에러 발생.
//    func dosomething(complition: @escaping (()-> Void)) {
//        // else 가 빠지면 Expected 'else' after 'guard' condition , insert else 라는 에러발생
//        guard isReady else {
//            completionhandler.append {
//                complition()
//            }
//            return
//        }
//        complition()
//    }
//}
//
//APICaller().dosomething {
//    <#code#>
//}
*/

var a = ""

func hi(name: String) {
    print(name)
    a = name
}

hi(name: "hihi")

print(a)
