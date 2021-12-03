//
//  CustomView.swift
//  CustomUIPractice
//
//  Created by Leo Ho on 2021/12/2.
//

import UIKit

class CustomImageButton: UIView {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var delegate: CustomImageButtonListener?
    var btnTag: String = ""
    
    
    override func awakeFromNib() {
        addXibView()
        btn.setTitle("", for: .normal)
    }
    
    func setInit(labelText: String, image: UIImage, tag: String) {
        label.text = labelText
        imageView.image = image
        btnTag = tag
    }
    
    @IBAction func btnPressed(_ sender: UIButton) {
        delegate?.target(tag: btnTag, label: label)
    }
}

// 只有這個檔可以呼叫
fileprivate extension CustomImageButton {
    // 加入畫面
    func addXibView() {
        if let loadView = Bundle(for: CustomImageButton.self).loadNibNamed("CustomImageButton", owner: self, options: nil)?.first as? UIView{
            addSubview(loadView)
            loadView.frame = bounds
        }
    }
}

@objc protocol CustomImageButtonListener: NSObjectProtocol {
    func target(tag: String, label: UILabel)
}
