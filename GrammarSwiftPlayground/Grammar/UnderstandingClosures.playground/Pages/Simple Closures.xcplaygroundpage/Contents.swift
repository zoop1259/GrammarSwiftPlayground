/*:
 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)

 # Simple Closures

*/
code(for: "The Simplest Closure") {
    // simplest function - No parameters and returns nothing
    func sayHello() {
        print("Hello")
    }
    sayHello() //기본적인 함수 실행
    // A closure equivalent
    //클로저를 활용한 방법
    //사실상 다 동일한 방법이고 결과다.
    let sayHelloClosure = { print("첫번째 방법")}
    let sayHelloClosure2: () -> Void = { print("두번쨰 방법")}
    let sayHelloClosure3: () -> () = { print("세번쨰 방법")}
    
    sayHelloClosure //이렇게하면 출력이 나오지 않는다.
    sayHelloClosure()
    sayHelloClosure2()
    sayHelloClosure3()

}

code(for: "Closures with parameters") {
    // function with a single parameter
    func sayHello(to name: String) {
      print("Hello \(name)")
    }
    sayHello(to: "Bill")

    // The closure equivalent
//    let say = { name in //클로저 내부에서 추론할 수 없을 때 직접 타입을 정해줘야 한다.
    let say = { (name: String) in
        print("hi \(name)")
    }
    say("dm")
    
    //클로저 내부에서 직접 추론가능하게 만드려면
    //(String)이 아닌 String만 쓰면
    /*
     error: Simple Closures.xcplaygroundpage:42:15: error: single argument function types require parentheses
         let say2: String -> () = { name in
                   ^~~~~~
                   (     )
     이런 에러가 뜬다.. (    ) 를 넣으라는 그림!?
     */
    let say2: (String) -> () = { name in
        print("hihi \(name)")
    }
    say2("안뇽")
}

code(for: "Closures that return something") {
    // Function with 2 parameters that returns an Int
    func sum(a: Int, b:Int) -> Int {
         a + b
    }
    let answer = sum(a: 5, b: 7)
    print(answer)

    // The closure equivalent
    let sums = { (a: Int, b: Int) in
        return a + b
    }
    
    let ansSums = sums(10, 5)
    print(ansSums)
    
    //반환자를 정해주면 return제거가능
    let sums2: (Int, Int) -> Int = { a,b in
        a + b
    }
    let ansSums2 = sums2(10, 10)
    print(ansSums2)
    
}

/*:

 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 */
