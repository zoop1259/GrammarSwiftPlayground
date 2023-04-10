/*:
 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)

 ## The Basics
Understanding the basics of Tuples
 
 A tuple is a compound data type that works very similarly to a struct, but tuples can be created and used on the fly.
*/
import Foundation

code(for: "1. Basic Tuple") {
    // Create a Tuple that will contain a country name and the country population along with the number of states/provinces
    //국가 이름과 국가 인구 및 주/도 수를 포함하는 튜플을 만듭니다
    let country = ("Canada", 37_000_000, 10)
    print(country.0)
    print(country.1)
    print(country.2)
   
}

code(for: "2. Decomposing Values") {
    // And decompose it to provide named values
    //그리고 상수로 튜플을 만들고 대입시켜도 된다. 만약 형태가 맞지 않는다면?
    //Type of expression is ambiguous without more context 에러 발생
//    let count1 = ("Asd", 123)
//    let (a,s,d) = count1
    
    let country = ("Canada", 37_000_000, 10)
    let (name, population, states) = country
    print(name)
    print(population)
    print(states)
}

code(for: "3. Rewrite the Basic Tuple using named values") {
    // But use named values when creating the tuple
    //아니면 직접 이름을 지어줘도 된다.
    let country = (name: "Canada", population: 37_000_000, states: 10)
    print(country.name)
    print(country.population)
    print(country.states)
}

/*:

 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 */
