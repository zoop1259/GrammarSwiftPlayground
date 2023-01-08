/*:
 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)

 # A SwiftUI example
 */
import UIKit
import PlaygroundSupport
import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationView {
        //정렬의 기본값은 center고 간격은 nil이므로 같은 값으로 사용할꺼면 없어도 된다./
        //VStack(alignment: .center, spacing: nil) {
        VStack {
            Text("helo")
            Text("world")
        }
        //VStack(alignment: <#T##HorizontalAlignment#>, spacing: <#T##CGFloat?#>, content: <#T##() -> _#>)
        
        .navigationTitle("SwiftUI Example")
    }
    .playgroundPhone(.iPhoneSE)
  }
}

PlaygroundPage.current.setLiveView(ContentView())
//: [Next](@next)
