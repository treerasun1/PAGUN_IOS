//
//  TextFieldView.swift
//  FWCheckin
//
//  Created by tai on 9/3/2564 BE.
//

import UIKit

class TextFieldView: UIView ,UITextFieldDelegate{
   
    let label : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = UIColor.AppColor.fontDescription
        return label
    }()
    
    let textField : UITextField = {
        let txf = UITextField()
        txf.font = UIFont.boldSystemFont(ofSize: 14)
        txf.translatesAutoresizingMaskIntoConstraints = false
        txf.clearButtonMode = .whileEditing
        txf.textColor = UIColor.AppColor.fontFocus
        return txf
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.AppColor.bgTextField
        textField.delegate = self
        
        layer.cornerRadius = 5
        
        addSubview(label)
        addSubview(textField)
        
        let vSpace = frame.width * 0.02
        let hSpace = frame.width * 0.03
        
        addConstraintsWithFormat("V:|-\(vSpace)-[v0]-\(vSpace * 0.1)-[v1]", views: label,textField)
        addConstraintsWithFormat("H:|-\(hSpace * 2)-[v0]-\(hSpace * 2)-|", views: label)
        addConstraintsWithFormat("H:|-\(hSpace * 2)-[v0]-\(hSpace * 2)-|", views: textField)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == textField {
               let allowedCharacters = CharacterSet(charactersIn:"+0123456789 ")//Here change this characters based on your requirement
               let characterSet = CharacterSet(charactersIn: string)
                 // return allowedCharacters.isSuperset(of: characterSet)
            if(allowedCharacters.isSuperset(of: characterSet))
            {
                guard let textFieldText = textField.text,
                      let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                    return false
                }
                
                let substringToReplace = textFieldText[rangeOfTextToReplace]
                let count = textFieldText.count - substringToReplace.count + string.count
                
                
                return count <= 10
            }
            return allowedCharacters.isSuperset(of: characterSet)
        }
        return true
      
    }
    
}

