import UIKit
import Foundation
/*


/*
var greeting = "Hello, playground"

let a = sendStr(a: "안녕")

func sendStr(a: String) {
    print(a)
}


let aa: () = sendStr(a: "안뇽")
// str() 함수 호출
// str 함수 자체(이름)을 넘겨줌
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}

returnFifteen()

func nonescaping(closure : (String) -> Void) {
    print("function start")
    closure("closure called")
    
    print("function end")
}

nonescaping { (value) in
    print(value)
}


var completionhandler : [()->Void] = []

//    //Cannot convert value of type '(String) -> Void' to expected argument type '() -> Void'
//'(String) -> Void' 유형의 값을 필요한 인수 유형 '() -> Void'로 변환할 수 없습니다.

//func escaping(closure : @escaping (String) -> Void) {
func escaping(closure : @escaping () -> Void) {
    print("function start")
    
    //함수가 끝나고 나서도 호출이 된다.
    //근데 사용할수있는건 잘 모르겠다 아직.
    //Cannot convert value of type '(String) -> Void' to expected argument type '() -> Void'
    completionhandler.append(closure)
    
    
    
    print("function end")
}

//Contextual closure type '() -> Void' expects 0 arguments, but 1 was used in closure body
//상황별 폐쇄 유형 ' () -> Void'에는 0개의 인수가 필요하지만 1이 폐쇄 본문에 사용되었습니다.
//escaping { (value) in //(value)가 문제인것
//    print(value)
//}

escaping {
    print("hello")
    print("hihi")
}

completionhandler[0]() //프린트가 배열에 담긴다.
//completionhandler[1]() 

*/




/*
//왜 사이트들에선 var intarr = ([Int]() -> Void)
var intarr = [Int]()
//func getSumOf(array:[Int], handler: @escaping ((Int)->Void)) {
//Escaping closure captures non-escaping parameter 'handler'
func getSumOf(array:[Int], handler: @escaping ((Int)->Void)) {
    var sum: Int = 0
    for value in array {
        sum += value
    }

    DispatchQueue.global().asyncAfter(deadline: .now() + 1.0){
        handler(sum)
        intarr.append(sum)
        //intarr.append(handler(sum))
    }

//여기서 handler를 호출해도 값이없음
    print("handler sum : ",handler(sum))
//sum은 나오지.
    print("sum : ",sum)
}

//1초뒤에 값이 더해져서 12가 나오지.
getSumOf(array: [5,7]) { result in
    print(result)
}

print("바로 실행되기에 값은 없다.",intarr) // []
DispatchQueue.global().asyncAfter(deadline: .now() + 2.0){
    print("비동기 1초후 값이 넣어져서 2초후엔 값이 들어온다.",intarr)
} // [12]

/*
막상 비동기식이라고 하지만 함수를 동시에 호출하는데 ... 음...
서버 상태가 좋지 않아 응답이 바로되지 않고 지연시간이 걸렸을때 리콜을 위해 사용하는 것일까?
*/


var a = ""

//단일 인수 함수 유형에는 괄호가 필요합니다. String에서 에러나는 이유
//func sendString(str: @escaping String -> Void) {
func sendString(str : String ,handler : @escaping (String) -> Void) {
    
    a = str
    
    print(a)
    
    
}

sendString(str: "hi") { result in
    print(result)
}

func getString(a: String) {
    
    sendString(str: a) { result in
        print(result)
    }
    
}

getString(a: "hihi")
*/

var comhandlers : ((Int) -> Void)? = nil

func dummyGet(comhandler: @escaping (Int) -> Void) {
    comhandlers = comhandler
    
    print(comhandler)
    
}

print(
    dummyGet() {_ in }
)

func twoString(oneoneTier: String, oneoneImgUrl: String, twotwoTier: String, twotwoImgUrl: String) -> (d1: String, d2: String) {
    
    return ("a","b")
}

let a = "챔스"
var Adict = ["oneTier" : a]

print(Adict)

//func twoDict(oneoneTier: String, oneoneImgUrl: String, twotwoTier: String, twotwoImgUrl: String) ->
//(d1: [String:String], d2: [String:String]) {
//
//    return ([oneoneTier:oneoneImgUrl],[twotwoTier:twotwoImgUrl])
//}

//let b = twoDict(oneoneTier: "55", oneoneImgUrl: "110", twotwoTier: "asd", twotwoImgUrl: "asdasd")

//print(b.d1)


func asd(tier: Int) -> [String:String] {
    
    var retu = [String:String]()
    
    if tier == 50 {
        retu =  ["aa":"bb"]
    }
    
    if tier == 60 {
        retu =  ["a":"b"]
    }
    
    return retu
}


let arr = [50,60]

for i in arr {
    
    var oneone = [String:String]()
    var twotwo = [String:String]()
    
    if i == 50 {
        oneone = asd(tier: 50)
        print("1vs1",oneone.keys)
    }
    
    if i == 60 {
        twotwo = asd(tier: 60)
        print("2vs2",twotwo.values)
    }
    
}
*/

//escaping은 다른함수에서 사용할떄 클로저로 값을 처리한다. ㅇㅋ?
func FirstData(one: Int, oneSend: @escaping (Int) -> Void) {
    oneSend(one + one)
    print("one: \(one)")
}

func SecondData(two: Int, twoSend: @escaping (Int) -> Void) {
    FirstData(one: 0) { result in
        guard result != 0 else {
            print("왜 0을 더해ㅡㅡ")
            return
        }
        twoSend(result + two)
        print("result \(result)", "two : \(two)")
    }
}

SecondData(two: 10) { result in
    print("secondData : \(result)")
}

//후 기본적인 escaping을 다뤄보았다. 그럼 복잡한escaping은 어떻게 다룰것인가.

