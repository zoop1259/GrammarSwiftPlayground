/*:
 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)

 ## compactMap and flatMap
### compactMap
 Use compactMap receive an array of nonoptional values when your transformation produces an optional value.

*/
let stringValues = ["1", "two", "3", "4", "five"]
let intValues = stringValues.compactMap { Int($0) }
intValues //nil을 제외한 배열을 리턴함.
/*:
### flatMap
Use this method to receive a single-level collection when your transformation produces a sequence or collection for each element.
*/
let groups = [[1,3,9,11],[5,7]]
let flatValues = groups.flatMap { $0 }
flatValues // 1차원 배열로 만들어 리턴해준다.

/*:

 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 */
