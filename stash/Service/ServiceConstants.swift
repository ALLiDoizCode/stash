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
            return "http"
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
            print("development")
            return "stash-demo-api"
        case .staging:
            print("staging")
            return "stash-demo-api"
        case .production:
            print("production")
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
#elseif STAGING
let environment: Environment = Environment.staging
#else
let environment: Environment = Environment.production
#endif

let baseUrl = environment.baseURL()

struct Path {
    
    struct Achievements {
        
        var fetch: String { return "\(baseUrl)/achievements/fetch" }
    
    }
}
