import UIKit

//let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
//let (a, b) = (n[0], n[1])

//let a = 5
//let b = 6
//
//if a <= 1000 {
//    if b <= 1000 {
//        for _ in 1...b{
//            for _ in 1...a{
//                print("*",terminator:"")
//            }
//            print("")
//        }
//
//    }
//}

//func solution(_ x:Int, _ n:Int) -> [Int64] {
//    var answer = [Int64]()
//    let x = 3
//    let n = 5
//
//
//    for i in 1...n {
//        answer.append(Int64(i*x))
//    }
//
//    return answer
//}

//func solution(_ arr:[Int]) -> Double {
//
////    var arr = [Int]()
//    let arr = [1,2,3,4,5]
//    var arrre = arr.reduce(0, +)
//    let arrs = arr.count
//
//    print(arrre)
//    print(arrs)
//
//
//    return arrre
//}

//func ss() {
//    let arr = [1,2,3,4,5]
//    let arrre = arr.reduce(0, +)
//    let arrs = arr.count
//    let multi = Double(arrre/arrs)
//    print(arrre)
//    print(arrs)
//    print(multi)
//}
//

func solution(_ arr:[Int]) -> Double {
 
//    let input = Array(readLine()!)
//    let result = input.map { Int(String($0))! }
//    print(result)
//    print(type(of: result))
    
    let arr = Array(readLine()!).map { Int(String($0))!}
//    let arr: [Int]
    let arrre = arr.reduce(0, +)
    let arrs = arr.count
    let multi = Double(arrre/arrs)
    
    print(arr)
    
    return multi
}

print(solution([1]))
