import Foundation

struct AchievementsAPI: APIHandler {
    
    func makeRequest(from parameters: [String: Any]) -> Request {
        // url components
        var components = URLComponents(string: Path.Achievements().fetch)!
        var queryItems = [URLQueryItem]()
        for (key, value) in parameters {
            queryItems.append(URLQueryItem(name: key, value: "\(value)"))
        }
        components.queryItems = queryItems
        // url request
        let url = components.url
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "GET"
        // prepares auth request (sets header params, any additional configurations)
        let request = Request(urlRequest: urlRequest, requestBuilder: AuthRequest())
        print(request.urlRequest)
        return request
    }
    
    func parseResponse(data: Data) throws -> Achievements {
        return try defaultParseResponse(data: data)
    }
}



