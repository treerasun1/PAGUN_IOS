//
//  MainActivityLayout.swift
//  PAGUN
//
//  Created by Treerasun Chanachok on 3/5/23.
//

import UIKit

class MainOTPLayout: UIViewController{

    
    static let textFieldWidth = UIScreen.main.bounds.width * 0.8
    static let textFieldHeight = UIScreen.main.bounds.height * 0.07
    
    static let buttonWidth = textFieldWidth
    static let buttonHeight = textFieldHeight
    
    
    let lbl : UILabel = {
        let label = UILabel()
        label.text = "ใส่รหัสยืนยัน"
        label.textColor =  UIColor.AppColor.lblBlack
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        return label
    }()
    
   
    let lbl2 : UILabel = {
        let label = UILabel()
        label.textColor = UIColor.AppColor.lblPink
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        return label
    }()
    
    let MboileTextFieldView : TextFieldView = {
        let txf = TextFieldView(
            frame: CGRect(origin: CGPoint.zero, size: CGSize(width: textFieldWidth, height: textFieldHeight)))
        txf.label.text = "เบอร์โทรศัพท์"
        txf.textField.tag = 1
        txf.cornerRadius = 10;
        return txf
    }()
    
    let confirmbtn : UIButton = {
           let btn = UIButton()
        btn.backgroundColor = UIColor.AppColor.btnGreen
           btn.cornerRadius = 15
        btn.titleLabel?.font =
            UIFont.systemFont(ofSize: 18)
           btn.setTitle("ตกลง", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
       // btn.addTarget(self, action: #selector(onClickConfirm(_:)), for: .touchUpInside)
           return btn
       }()
    
   
     func setupView() {
        view.backgroundColor = UIColor.AppColor.background
        view.addSubview(lbl)
        view.addConstraintsWithFormat("V:[v0(60)]", views: lbl)
        view.addConstraintsWithFormat("H:|-20-[v0]-20-|", views: lbl)
        lbl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 150).isActive = true
      
        view.addSubview(lbl2)
        view.addConstraintsWithFormat("V:[v0(40)]", views: lbl2)
        view.addConstraintsWithFormat("H:|-20-[v0]-20-|", views: lbl2)
        lbl2.topAnchor.constraint(equalTo: lbl.bottomAnchor,constant: 5).isActive = true
        
        view.addSubview(MboileTextFieldView)
        view.addConstraintsWithFormat("V:[v0(40)]", views: MboileTextFieldView)
        view.addConstraintsWithFormat("H:|-20-[v0]-20-|", views: MboileTextFieldView)
        MboileTextFieldView.topAnchor.constraint(equalTo: lbl2.bottomAnchor,constant: 40).isActive = true
        
        view.addSubview(confirmbtn)
        view.addConstraintsWithFormat("V:[v0(40)]", views: confirmbtn)
        view.addConstraintsWithFormat("H:|-80-[v0]-80-|", views: confirmbtn)
        confirmbtn.topAnchor.constraint(equalTo: MboileTextFieldView.bottomAnchor,constant: 40).isActive = true
        
         lbl2.text = "รหัสยืนยันส่งไปยัง SMS บนโทรศัพท์มือถือของท่าน ที่ได้ระบุหมายเลข \(Constant.MoblieNumber)"
    }
    
  
    func setupView(completion : @escaping ()->()) {
        DispatchQueue.main.async {
            self.setupView()
            completion()
        }
    }
    
   
}

