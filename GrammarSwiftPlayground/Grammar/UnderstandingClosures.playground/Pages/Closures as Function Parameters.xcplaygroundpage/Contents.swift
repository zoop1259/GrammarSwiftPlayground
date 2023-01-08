/*:
 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 
 # Closures as Function Parameters
 */
import Foundation

code(for: "Closures as Function Parameters") {
    func sayHello(to name: String, finallySayIt: (String) -> ()) {
        let newName = name.uppercased()
        finallySayIt(newName)
    }

    // Option 1
    sayHello(to: "daemin", finallySayIt: { name in
        print("hi \(name)")
    })
    // Option 2 후행클로저
    sayHello(to: "kang") { name in
        print("halo \(name)")
    }
    
    // Option 3
    let reallySaiIt: (String) -> () = { name in
        print("hello \(name)")
    }
    sayHello(to: "나다", finallySayIt: reallySaiIt) //변수 클로저 이용하기.
    
}

//2초지연 클로저!
code(for: "Escaping Trailing Closure") {
    func sayHello(to name: String, finallySayIt: @escaping (String) -> ()) {
        let newName = name.uppercased()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            finallySayIt(newName)
        }
    }
    
    sayHello(to: "kang") { name in
        print("halo \(name)")
    }
}


/*:
 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 */
