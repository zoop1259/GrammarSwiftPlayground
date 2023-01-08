//: A UIKit based Playground for presenting user interface
  
import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    var body: some View {
        Text("플레이그라운드에 어서와")
        Text("이렇게 ").foregroundColor(.green).italic() //이렇게 커스텀도 가능
        + Text("합치기") + Text("가능")
        //기본적으로 라인수에 제한이 없지만 직접적으로 걸어주면 된다.
        Text("헬로 \n 스위프트유아이").font(.title)
        Text("이것도 헬로 \n 스위프트 유아이").font(.title).lineLimit(1) //이렇게 한줄로 제한걺
    }
}
/*
 PlaygroundPage.current.liveView = ContentView()
 이 한줄만 쓰면
 Cannot assign value of type 'ContentView' to type 'PlaygroundLiveViewable?'
 Insert ' as! PlaygroundLiveViewable'
 에러가 뜨는데 UIKit프레임워크랑 통합하기 위한 작업을 해주지 않아서이다.
 
 */

//하지만 이방법은 옛날방법
//PlaygroundPage.current.liveView = UIHostingController(rootView: ContentView())

//iOS 13이후부터 가능한 setLiveView가 있다.
//함수의 정의
//func setLiveView<IncomingView>(_ newLiveView: IncomingView) where IncomingView : View

//사용 예
PlaygroundPage.current.setLiveView(ContentView())
