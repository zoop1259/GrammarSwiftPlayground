import UIKit

public struct UserInfo: Codable {
    public let ip: String
}

func getMyIP(compilationHandler: @escaping (UserInfo) -> Void) {
        guard let url:URL = URL(string: "http://date.jsontest.com/?service=ip") else {
            return
        }
        var urlReq:URLRequest = URLRequest.init(url: url)
        
        urlReq.httpMethod = "GET"
        urlReq.allHTTPHeaderFields = ["Content-Type":"application/json"]
        
        let IPTask = URLSession.shared.dataTask(with: urlReq) { (data, res, err) in
            if let data = data {
                let jsonData = try? JSONDecoder().decode(UserInfo.self, from: data)
                guard let rsData = jsonData else {
                    return
                }
                compilationHandler(rsData)
            }
        }
        
        IPTask.resume()
}

