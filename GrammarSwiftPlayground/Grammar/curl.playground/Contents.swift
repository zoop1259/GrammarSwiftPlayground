import PlaygroundSupport
import Foundation

//let key = "ktlEDDlV7w4qvY526pH786O5hsTFVWaKrZZx8d88"
//let url = URL(string: "https://open-api.bser.io/v1/data/hash")
//let contentType = "application/json"
//
////setting and converting the uniqueNumber (input) to a data item so it can be recognized by the API
//
//var uniqueNumber: Data? = "{\"uniqueNumber\": \"F09\"}".data(using: .utf8) // non-nil
//
//var request = URLRequest(url: url!)
//request.httpMethod = "POST"
//request.addValue(key, forHTTPHeaderField: "x-api-key")
//request.addValue(contentType, forHTTPHeaderField: "Content-Type")
//request.httpBody = uniqueNumber
//
//URLSession.shared.dataTask(with: request) { (data, response, error) in
//    guard error == nil else { print(error!.localizedDescription); return }
//    guard let data = data else { print("Empty data"); return }
//
//    if let str = String(data: data, encoding: .utf8) {
//        print(str)
//    }
//}.resume()


//성공;;;
//참고 : https://stackoverflow.com/questions/52730997/how-do-i-use-an-api-with-an-api-key-in-xcode
let eternalreturnURL = URL(string: "https://open-api.bser.io/v1/data/hash")
if let unwrappedURL = eternalreturnURL {
    var request = URLRequest(url: unwrappedURL)
    request.addValue("ktlEDDlV7w4qvY526pH786O5hsTFVWaKrZZx8d88", forHTTPHeaderField: "x-Api-key")
    let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
        // you should put in error handling code, too
        if let data = data {
            print(data)
            if let str = String(data: data, encoding: .utf8) {
                print(str)
            }
//            do {
//                let json = try JSONDecoder().decode(Response.self, from: data) as Response
//                // HERE'S WHERE YOUR DATA IS
//                print(json.items.count)
//            } catch {
//                print(error.localizedDescription)
//            }
        }
    }
    dataTask.resume()
}
PlaygroundPage.current.needsIndefiniteExecution = true
