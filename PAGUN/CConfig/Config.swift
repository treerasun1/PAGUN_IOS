import UIKit
import Alamofire

class Config: NSObject {
  
    struct ProductionServer {
        static let originURL = "http://183.90.170.87:3000/api/"
    }
   
    struct UrlApi {
        
        static let SendOTP = "sms/SendOTP"
       
    }
    struct  Params {
      static var access_token = "7320fc5e-0047-44c8-8bb7-0ed687731b77:9237fd8a-9616-4f45-9470-70828353aba1"
    }
}
enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case apiKey = "api-key"
    case accessToken = "ezwow-access-token"
}

enum ContentType: String {
    case json = "application/json"
}

