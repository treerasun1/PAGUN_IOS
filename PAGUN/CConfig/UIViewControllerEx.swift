//
//  UIViewControllerEx.swift
//  FWCheckin
//
//  Created by tai on 28/12/2563 BE.
//
import UIKit

extension UIViewController{
    
    func hideKeyboardWhenTappedAround() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
       
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func hideKeyboardWhenTappedAroundTableView() {
        let tapGesture = UITapGestureRecognizer(target: self, action:#selector(handleTap(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            // Do your thang here!
            self.view.endEditing(true)
            for textField in self.view.subviews where textField is UITextField {
                textField.resignFirstResponder()
            }
        }
        sender.cancelsTouchesInView = false
    }
    
   
    
    
    
    func startLoading()
    {
        //indicator
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            let activityView = UIActivityIndicatorView(style: .whiteLarge)
            activityView.color = UIColor.black
            activityView.center = self.view.center
            activityView.tag = 999
            activityView.startAnimating()
            self.view.addSubview(activityView)
        }
    }
    
    func stopLoading()
    {
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            if let activityView = self.view.viewWithTag(999) as? UIActivityIndicatorView {
                activityView.stopAnimating()
                self.view.willRemoveSubview(activityView)
                activityView.removeFromSuperview()
            }
        }
    }
    
    var topbarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.size.height +
            (self.navigationController?.navigationBar.frame.height ?? 44.0)
    }
    
}

