//
//  MainOTP.swift
//  PAGUN
//
//  Created by Treerasun Chanachok on 3/5/23.
//

import Foundation
import UIKit
import AEOTPTextField


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
