/*:
 [< Previous](@previous)                    [Home](Introduction)                   
 ## List
 Lists, ForEach and trailing closures
 */

import SwiftUI
import PlaygroundSupport


struct ContentView2: View {
    @State private var items = ["Item 1", "Item 2", "item 3"]
    var body: some View {
        //List중에서 가장 많이 쓰이는 형태
//        List(<#T##data: RandomAccessCollection##RandomAccessCollection#>, rowContent: <#T##(Identifiable) -> View#>)
        
        //이렇게 간단히 할 수도 있지만
//        List(items, id: \.self) { item in
//            Text(item)
//        }
        
        //이렇게 List생성후 ForEach로 해도 된다.
        //ForEach를 사용하는 장점은 각 루프에 대한 onDelete메서드를 추가할 수 있다는 것.
        List {
            ForEach(items, id:\.self) { item in
                Text(item)
            }
//            .onDelete { indexSet in
//                items.remove(atOffsets: indexSet)
//            }
            .onDelete(perform: deleteRow)
        }
    }
    func deleteRow(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
}

PlaygroundPage.current.setLiveView(ContentView2())

/*:
[< Previous](@previous)                    [Home](Introduction)
*/
