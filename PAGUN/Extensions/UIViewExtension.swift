import Foundation
import UIKit

extension UIView {
    
    func addConstraintsWithFormat(_ format: String, views: UIView..., topPadding: CGFloat = 0, leftPadding: CGFloat = 0, bottomPadding: CGFloat = 0, rightPadding: CGFloat = 0) {
        var viewsDictionary = [String: UIView]()
        
        var metrics = [String: Any]()
        
        if #available(iOS 11.0, *) {
            metrics = [
                "top": safeAreaInsets.top + topPadding,
                "bottom": safeAreaInsets.bottom + bottomPadding,
                "left": safeAreaInsets.left + leftPadding,
                "right": safeAreaInsets.right + rightPadding,
            ]
            
        } else {
            metrics = [
                "top": topPadding,
                "bottom": bottomPadding,
                "left": leftPadding,
                "right": rightPadding,
            ]
        }
        
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
       addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: metrics, views: viewsDictionary))
    }
    
    func addConstraintsWithFormatAndOptions(_ format: String, views: UIView..., options: NSLayoutConstraint.FormatOptions, topPadding: CGFloat = 0, leftPadding: CGFloat = 0, bottomPadding: CGFloat = 0, rightPadding: CGFloat = 0) {
        var viewsDictionary = [String: UIView]()
        
        var metrics = [String: Any]()
        
        if #available(iOS 11.0, *) {
            metrics = [
                "top": safeAreaInsets.top + topPadding,
                "bottom": safeAreaInsets.bottom + bottomPadding,
                "left": safeAreaInsets.left + leftPadding,
                "right": safeAreaInsets.right + rightPadding,
            ]
            
        } else {
            metrics = [
                "top": topPadding,
                "bottom": bottomPadding,
                "left": leftPadding,
                "right": rightPadding,
            ]
        }
        
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: options, metrics: metrics, views: viewsDictionary))
    }
    
    func setRadius(radius: CGFloat? = nil) {
        self.layer.cornerRadius = radius ?? self.frame.width / 2;
        self.layer.masksToBounds = false
        self.clipsToBounds = true
    }
    
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    
    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        
        let backgroundCGColor = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor =  backgroundCGColor
    }
    
    func setShadow(){
        self.addShadow(offset: CGSize.init(width: 0, height: 3), color: UIColor.black, radius: 2.0, opacity: 0.35)
    }
    
//    func setSafeArea(){
//        self.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
//        self.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
//        self.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor).isActive = true
//        self.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor).isActive = true
//    }
    
    func handleEstimatedFrame(_ text: String, _ minus: CGFloat, font: UIFont) -> CGRect {
        let size = CGSize(width: self.frame.width - (minus), height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        return NSString(string: text).boundingRect(with: size, options: options, attributes: [kCTFontAttributeName as NSAttributedString.Key: font], context: nil)
    }
    
    func centerXY(_ view: UIView, x: CGFloat, y: CGFloat, _ centerX: NSLayoutXAxisAnchor? = nil, _ centerY: NSLayoutYAxisAnchor? = nil) -> [NSLayoutConstraint] {
        
        translatesAutoresizingMaskIntoConstraints = false
        var anchors = [NSLayoutConstraint]()
        
        if let centerX = centerX { anchors.append(centerX.constraint(equalTo: view.centerXAnchor, constant: x)) }
        if let centerY = centerY { anchors.append(centerY.constraint(equalTo: view.centerYAnchor, constant: y)) }
        
        anchors.forEach({$0.isActive = true})
        
        return anchors
    }
    
    func anchor(_ top: NSLayoutYAxisAnchor? = nil, _ right: NSLayoutXAxisAnchor? = nil, _ bottom: NSLayoutYAxisAnchor? = nil, _ left: NSLayoutXAxisAnchor? = nil, _ topConstant: CGFloat = 0, _ rightConstant: CGFloat = 0, _ bottomConstant: CGFloat = 0, _ leftConstant: CGFloat = 0, width: CGFloat = 0, height: CGFloat = 0) -> [NSLayoutConstraint] {
        
        translatesAutoresizingMaskIntoConstraints = false
        var anchors = [NSLayoutConstraint]()
        
        if let top = top { anchors.append(topAnchor.constraint(equalTo: top, constant: topConstant)) }
        if let right = right { anchors.append(rightAnchor.constraint(equalTo: right, constant: -rightConstant)) }
        if let bottom = bottom { anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant)) }
        if let left = left { anchors.append(leftAnchor.constraint(equalTo: left, constant: leftConstant)) }
        if width > 0 { anchors.append(widthAnchor.constraint(equalToConstant: width)) }
        if height > 0 { anchors.append(heightAnchor.constraint(equalToConstant: height)) }
        
        anchors.forEach({$0.isActive = true})
        
        return anchors
    }
    
    // OUTPUT 1
    func dropShadow(scale: Bool = true) {
      layer.masksToBounds = false
      layer.shadowColor = UIColor.black.cgColor
      layer.shadowOpacity = 0.5
      layer.shadowOffset = CGSize(width: -1, height: 1)
      layer.shadowRadius = 1

      layer.shadowPath = UIBezierPath(rect: bounds).cgPath
      layer.shouldRasterize = true
      layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }

    // OUTPUT 2
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
      layer.masksToBounds = false
      layer.shadowColor = color.cgColor
      layer.shadowOpacity = opacity
      layer.shadowOffset = offSet
      layer.shadowRadius = radius

      layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
      layer.shouldRasterize = true
      layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    public func removeAllConstraints() {
        var _superview = self.superview
        
        while let superview = _superview {
            for constraint in superview.constraints {
                
                if let first = constraint.firstItem as? UIView, first == self {
                    superview.removeConstraint(constraint)
                }
                
                if let second = constraint.secondItem as? UIView, second == self {
                    superview.removeConstraint(constraint)
                }
            }
            
            _superview = superview.superview
        }
        
        self.removeConstraints(self.constraints)
        self.translatesAutoresizingMaskIntoConstraints = true
    }
    
    @IBInspectable public var borderColor: UIColor? {
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
        set {
            guard let color = newValue else {
                layer.borderColor = nil
                return
            }
            layer.borderColor = color.cgColor
        }
    }
    
    /// : Border width of view; also inspectable from Storyboard.
    @IBInspectable public var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    /// Corner radius of view; also inspectable from Storyboard.
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = abs(CGFloat(Int(newValue * 100)) / 100)
        }
    }
    /// : Shadow color of view; also inspectable from Storyboard.
    @IBInspectable public var shadowColor: UIColor? {
        get {
            guard let color = layer.shadowColor else { return nil }
            return UIColor(cgColor: color)
        }
        set {
            layer.shadowColor = newValue?.cgColor
        }
    }
    
    /// : Shadow offset of view; also inspectable from Storyboard.
    @IBInspectable public var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    /// : Shadow opacity of view; also inspectable from Storyboard.
    @IBInspectable public var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    /// : Shadow radius of view; also inspectable from Storyboard.
    @IBInspectable public var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    func fillToSuperView(){
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            leftAnchor.constraint(equalTo: superview.leftAnchor).isActive = true
            rightAnchor.constraint(equalTo: superview.rightAnchor).isActive = true
            topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
            bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
        }
    }
    var screen : CGRect {
        get {
            return UIScreen.main.bounds
        }
    }
    
    // src : https://medium.com/@sdrzn/adding-gesture-recognizers-with-closures-instead-of-selectors-9fb3e09a8f0b
    fileprivate struct AssociatedObjectKeys {
        static var tapGestureRecognizer = "MediaViewerAssociatedObjectKey_mediaViewer"
    }
    
    fileprivate typealias Action = (() -> Void)?
    
    // Set our computed property type to a closure
    fileprivate var tapGestureRecognizerAction: Action? {
        set {
            if let newValue = newValue {
                // Computed properties get stored as associated objects
                objc_setAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            }
        }
        get {
            let tapGestureRecognizerActionInstance = objc_getAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer) as? Action
            return tapGestureRecognizerActionInstance
        }
    }
    
    // This is the meat of the sauce, here we create the tap gesture recognizer and
    // store the closure the user passed to us in the associated object we declared above
    public func addTapGestureRecognizer(action: (() -> Void)?) {
        self.isUserInteractionEnabled = true
        self.tapGestureRecognizerAction = action
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    // Every time the user taps on the UIImageView, this function gets called,
    // which triggers the closure we stored
    @objc fileprivate func handleTapGesture(sender: UITapGestureRecognizer) {
        if let action = self.tapGestureRecognizerAction {
            action?()
        } else {
            print("no action")
        }
    }
    
    var snapshot: UIImage {
        return UIGraphicsImageRenderer(size: bounds.size).image { _ in
            drawHierarchy(in: bounds, afterScreenUpdates: true)
        }
    }

}


extension UIView {

    func rotate(_ toValue: CGFloat, duration: CFTimeInterval = 0.2) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        
        animation.toValue = toValue
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = CAMediaTimingFillMode.forwards
        
        self.layer.add(animation, forKey: nil)
    }
}

extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func pinEdgesToSuperView() {
        guard let superView = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leftAnchor.constraint(equalTo: superView.leftAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        rightAnchor.constraint(equalTo: superView.rightAnchor).isActive = true
    }
}
