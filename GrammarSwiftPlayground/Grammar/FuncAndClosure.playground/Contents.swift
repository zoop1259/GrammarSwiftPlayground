import UIKit


var get = 0

func sample1() -> Void {
    get = 5
}
func sample2() {
    get = 10
}

print(type(of: sample1()))
print(type(of: sample2()))

func sample3() {
    //에러발생 리턴값이 없으면 리턴X
//    return 0
    
    //이런식으로 그냥 스위프트 처음 배웠을때처럼 자연스럽게 함수만들듯이 만들면 됨
    get = 20
    
}
// -> Void는 생략가능.
func sameSample3() -> Void {
    get = 30
}

func sample4() -> () {
//    return {
//        print("asd")
//    }
}

//그러나 클로저를 반환하면서 보이드를 반환하면 클로저 안에것만 생략이 가능.
func sample5() -> () -> Void {
    return {
        print("asd")
    }
}

//이렇게 Void 차례에는 리턴없이 그냥 바로 출력 해도 된다. 때문에
func sample6() -> () -> () -> Void {
    print("처음 빈괄호")
    return {
        print("두번쨰 빈괄호")
        return {
            print("세번쨰 빈괄호 이렇게 까지 하는 함수는 없겠지.")
        }
        
    }
}

func voidGet(_ void: Int) -> Void {
    get = 55
}
voidGet(5)
print(get)

func retGet() -> Int {
    return 10
}
print(get)

                        //Void 생략
func car(_ some: String) -> String {
    print(some)
    return some
}

@discardableResult func cars(well: String) -> String {
    return well
}

//Double타입의 값을 반환하고, 이 값을 변수나 상수에 할당할 수 있다.
func returnDouble() -> Double {
    return 2.0
}

//이건 안된다?
func returnDoubleAndVoid(_: Double) -> Void {
    2.0
}
