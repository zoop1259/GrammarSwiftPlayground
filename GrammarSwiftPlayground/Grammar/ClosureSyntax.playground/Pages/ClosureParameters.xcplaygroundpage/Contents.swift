/*:
 [< Previous](@previous)                    [Home](Introduction)                    [Next >](@next)
 ## Introduction to function closure parameters
 Using Closures in a function
*/
import Foundation

code(for: "Remove argument label") {
    // Function
    func sayHello(_ name: String) {
        print("Hello \(name)")
    }
    // Call Function
    sayHello("Stewart")
}

code(for: "Add a second parameter as a closure") {
    // Function
    func sayHello(_ name: String, completion: () -> Void) {
        print("Hello \(name)")
        completion()
    }
    // Call function
   sayHello("Stewart", completion: {
       print("Done")
   })
}

code(for: "Same function but call using a trailing closure") {
    // Function
    func sayHello(_ name: String, completion: () -> Void) {
        print("Hello \(name)")
        completion()
    }
    // Call function
//    sayHello("Stewart") {
//        print("Done")
//    }
    sayHello("Stewart") {
        print("Done")
    }
}

code(for: "Add a parameter to the closure") {
    // Function
    func sayHello(_ name: String, completion: (String) -> Void) {
        print("Hello \(name)")
        let reverseName = String(name.reversed())
        completion(reverseName)
    }
    // Call function
    //두개의 파라미터를 받을 수 있다. 컴플리션이 문자열 매개변수 자체를 가지고 있으면 String을 클로저에서 사용해줘야한다.
//    sayHello(<#T##name: String##String#>, completion: <#T##(String) -> Void#>)
//    sayHello("aa") { <#String#> in
//        <#code#>
//    }
    
    sayHello("Stewart") { name in
        print("Your name reversed is \(name)")
    }
}
/*:
[< Previous](@previous)                    [Home](Introduction)                    [Next >](@next)
*/
