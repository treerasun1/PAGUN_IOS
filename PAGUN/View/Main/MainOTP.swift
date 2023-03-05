//
//  MainOTP.swift
//  PAGUN
//
//  Created by Treerasun Chanachok on 3/5/23.
//

import Foundation
import UIKit
import AEOTPTextField
import SwiftUI


class MainOTP: MainOTPLayout ,AEOTPTextFieldDelegate{
    
    func didUserFinishEnter(the code: String) {
            print(code)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         setupView()

        OTPTextField.otpDelegate = self
        OTPTextField.configure(with: 6)
    }
}
struct MainOTPPreView: UIViewControllerRepresentable{
    
    typealias UIViewControllerType = MainOTP
    
    func makeUIViewController(context: Context) -> MainOTP {
        MainOTP()
    }
    
    func updateUIViewController(_ uiViewController: MainOTP, context: Context) {
        
    }
}

struct MainOTP_Previews: PreviewProvider{
    static var previews: some View{
        MainOTPPreView()
    }
}
