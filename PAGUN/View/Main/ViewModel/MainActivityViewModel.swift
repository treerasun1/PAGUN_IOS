import Foundation
import Alamofire

class  MainActivityViewModel {
    
    fileprivate var baseUrl = ""
    var parameters: Parameters = [:]
   
    init(baseUrl: String,phone: String) {
        self.baseUrl = baseUrl
        self.parameters = ["phone": "\(phone)"]
    }
    
    typealias countriesCallBack = (_ status: Bool,_ message:String) -> Void
    var CallBack: countriesCallBack?

    func SendOTPCell(endPoint:String) {
       
        AF.request(self.baseUrl + endPoint, method: .post, parameters: self.parameters, encoding: JSONEncoding.default,headers: nil, interceptor: nil, requestModifier: nil).response { [self]
                   (responseDate) in
                   guard let data = responseDate.data else {return}
                   do{
                       let UserProfile = try JSONDecoder().decode(MainActivityModel.self, from: data)
                       self.CallBack?(true,UserProfile.value)
                    
                   }catch{
                    self.CallBack?(false,error.localizedDescription)
                   }
               }
        
    }
    func completionHandler(CallBack: @escaping countriesCallBack)  {
        self.CallBack = CallBack
    }
}

