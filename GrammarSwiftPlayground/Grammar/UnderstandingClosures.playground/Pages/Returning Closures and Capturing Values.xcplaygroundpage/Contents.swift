/*:
 [< Previous](@previous)           [Home](Introduction)

 ## Returning Closures and Capturing Values
More information here

*/

code(for: "Function returning a closure") {
    // function with no parameters returning a closure that has a parameter
    func sayIt() -> (String) -> Void {
        return { name in
            print("hi \(name)")
        }
    }
    sayIt()("daemin")
    let greetings = sayIt()
    greetings("kang")
    
}

code(for: "Capturing Values") {
    // Closure that captures a value
    func counter() -> () -> Void {
        var count = 1
        return {
            print("count: \(count)")
            count += 1
        }
    }
    
    let goCount = counter()
    goCount()
    goCount()
}


/*:

 [< Previous](@previous)           [Home](Introduction)
 */
