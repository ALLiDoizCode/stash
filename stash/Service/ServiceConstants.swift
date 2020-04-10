import Foundation

enum Environment {
    
    case development
    case staging
    case production
    
    func baseURL() -> String {
        return "\(urlProtocol())://\(subdomain()).\(domain())\(route())"
    }
    
    func urlProtocol() -> String {
        switch self {
        case .production:
            return "https"
        default:
            return "https"
        }
    }
    
    func domain() -> String {
        switch self {
        case .development, .staging, .production:
            return "herokuapp.com"
        }
    }
    
    func subdomain() -> String {
        switch self {
        case .development:
            return "stash-demo-api"
        case .staging:
            return "stash-demo-api"
        case .production:
            return "stash-demo-api"
        }
    }
    
    func route() -> String {
        //return "/api/v1"
        return ""
    }
    
}

extension Environment {
    func host() -> String {
        return "\(self.subdomain()).\(self.domain())"
    }
}


// MARK:- APIs

#if DEBUG
let environment: Environment = Environment.development
#else
let environment: Environment = Environment.staging
#endif

let baseUrl = environment.baseURL()

struct Path {
    
    struct Achievements {
        
        var fetch: String { return "\(baseUrl)/achievements/fetch" }
    
    }
}
