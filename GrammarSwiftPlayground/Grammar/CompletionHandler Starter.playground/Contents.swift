/*:
# Completion Handlers

* Created by [Stewart Lynch](https://twitter.com/StewartLynch) – [CreaTECH Solutions](https://www.createchsol.com.com)
* Last update: February 13, 2020

This playground is designed to provide a better understanding of creating and using Completion Handlers in Swift.

If you hit problems or have questions, you're welcome to tweet me [@StewartLynch](https://twitter.com/StewartLynch) or email <slynch@createchsol.com>.
&nbsp;
*/
import UIKit
/*:
 ## Standard Function
 */
func sampleFunction() {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
        print("Response from delayed sample function")
    }
}

//sampleFunction()

/*:
## The problem
*/
func sampleFunction2() {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
        print("Response from delayed sample function") //2
    }
    print("After the response from delayed sample function.") //1
}
//sampleFunction2()


/*:
## Function with () -> Void Completion Block
*/
// Add Completion Block
func sampleFunction3(completion: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
        print("Response from delayed sample function")
        completion()
    }

}


xzxx
/*:
### Calling the function
 How do I use the function?
*/
//sampleFunction3(completion: {
//    print("애프터 리스폰스")
//})

/*:
### Trailing Completion Block
 When your closure is the last parameter in a function or method
*/
//sampleFunction3 {
//    print("이렇게도 가능하다.")
//}



/*:
## Function with (T) -> Void Completion Block
 When your closure includes a parameter
*/
func sampleFunction4(completion: @escaping (String) -> Void) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
        print("Response from delayed sample function")
        completion("이렇게 스트링을 반환 할 수 있다")
    }
}

sampleFunction4 { response in
    print(response)
}

/*:
## Function with parameter and (T) -> Void Completion Block
 Wnen your function includes a parameter and your closure includes one too
*/
//문자열을 입력받고 그 문자열을 사용해 컴플리션블럭처리.
func sampleFunction5(searchString: String, completion: @escaping (String) -> Void) {
    print("You are about to search for \(searchString)")
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
        completion("sample5 : \(searchString)")
    }
}

sampleFunction5(searchString: "안녕") { response in
    print(response)
}



