//
//  MainActivity.swift
//  PAGUN
//
//  Created by Treerasun Chanachok on 3/5/23.
//

import Foundation
import UIKit

class MainActivity: MainActivityLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        confirmbtn.addTarget(self, action: #selector(SendOTP), for: .touchUpInside)
    }
    
    func AlertUI(Message:String,title:String)
    {
        let alert = UIAlertController(title: title, message: Message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
          switch action.style{
          case .default:
             self.viewWillAppear(true)
          case .cancel:
                print("cancel")

          case .destructive:
                print("destructive")


          }}))
     
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func SendOTP() {
        if(MboileTextFieldView.textField.text != "")
        {
            
        
        self.startLoading()
            
            let service = MainActivityViewModel(baseUrl: Config.ProductionServer.originURL, phone: MboileTextFieldView.textField.text ?? "")
  
            service.SendOTPCell(endPoint: Config.UrlApi.SendOTP)
        service.completionHandler { [weak self] (status,message) in
            if status {
                guard let self = self else {return}
                self.viewWillAppear(true)
             
                self.stopLoading()
                Config.Params.access_token = message
   
                let vc = MainOTP()
                
                Constant.MoblieNumber = self.MboileTextFieldView.textField.text ?? ""
               // print("Test :\(Constant.MoblieNumber)")
                UIApplication.shared.windows.first?.rootViewController = vc
                UIApplication.shared.windows.first?.makeKeyAndVisible()
            }
            else
            {
              self?.AlertUI(Message: message, title: "Error")
              self?.stopLoading()
            }
            
        }
            
        
    }
    else
    {
        self.AlertUI(Message: "Enter", title: "Error")
    }
    }
   
    

    
}

