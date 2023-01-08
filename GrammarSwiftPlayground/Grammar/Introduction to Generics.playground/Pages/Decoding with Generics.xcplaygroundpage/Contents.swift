/*:
 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 
 ## Decoding with Generics
 Reduce code by using generics in your functions
 
 */
import Foundation

code(for: "Sample Decoding") {
    // consider this function to decode JSON from a file in your app's bundle
    //앱 번들의 파일에서 JSON을 디코딩하려면 이 기능을 고려하십시오.
    //근데 이방법으로하면 정해진 모델이 아니면 불가능하기 떄문에 좀 더 유연한방법이 필요함.
    func fetchGoals(completion: @escaping ([Goal]) -> Void) {
        guard let goalsURL = Bundle.main.url(forResource: "Goals", withExtension: "json") else {
            fatalError("Could not find json file")
        }
        guard let goalsData = try? Data(contentsOf: goalsURL) else {
            fatalError("Could not convert data")
        }
        let decoder = JSONDecoder()
        guard let goals = try? decoder.decode([Goal].self, from: goalsData) else {
            fatalError("There must be a problem decoding....")
        }
        completion(goals)
    }
    
    fetchGoals { (goals) in
        for goal in goals {
            print(goal.name)
        }
    }
}

//여기서 배워야 할 것 Bundle. 에 대해서.
code(for: "Generic Conversion") {
    // Replicate the function in the previous example to use a generic type
    //제네릭 유형을 사용하려면 이전 예제의 함수를 복제합니다.
    //제네릭 T가 디코더블을 준수하고 그에 맞게 핸들링을 하면 사용가능하다.
    //T:Decodable 만 사용하면 두가지 문제가 생김
    //1.여기선 Bundle을 통해 Resources에 있는 파일이름을 사용했지만 내가 직접 사용할 프로젝트에선 다른 방식으로 사용 될 것이다.
    //예를 들면, url주소자체를 받아올 text를 입력받아야 하기 떄문에 textLabel: String이런식으로 쓰고
    //이 함수를 사용 swift파일에서는 func exam(textLabel: self.nameLabel.text) { _ in } 이런식으로 사용 될 것이다.
    //
    func fetchData<T: Decodable>(fileName: String, completion: @escaping (T) -> Void) {
        guard let jsonURL = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            fatalError("Could not find json file")
        }
        guard let jsonData = try? Data(contentsOf: jsonURL) else {
            fatalError("Could not convert data")
        }
        let decoder = JSONDecoder()
        guard let results = try? decoder.decode(T.self, from: jsonData) else {
            fatalError("There must be a problem decoding....")
        }
        completion(results)
    }
    
    //위의 컴플리션을 resources로 받고 resources의 제네릭 형태는 [Resource]라고 해준다.
    fetchData(fileName: "Resources") { (resources:[Resource]) in
        for resource in resources {
            print(resource.resource)
        }
    }
    print("-------------------")
    fetchData(fileName: "Goals") { (goals:[Goal]) in
        for goal in goals {
            print(goal.name)
        }
    }
}

/*:
 
 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 */
