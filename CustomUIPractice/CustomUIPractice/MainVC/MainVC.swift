//
//  MainVC.swift
//  CustomUIPractice
//
//  Created by Leo Ho on 2021/12/2.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var customImageButton1: CustomImageButton!
    @IBOutlet weak var customImageButton2: CustomImageButton!
    @IBOutlet weak var customImageButton3: CustomImageButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customImageButton1.delegate = self
        customImageButton2.delegate = self
        customImageButton3.delegate = self
        
        customImageButton1.setInit(labelText: "A", image: UIImage(systemName: "person")!, tag: "1")
        customImageButton2.setInit(labelText: "B", image: UIImage(systemName: "pencil")!, tag: "2")
        customImageButton3.setInit(labelText: "C", image: UIImage(systemName: "trash")!, tag: "3")
    }
}

extension MainVC: CustomImageButtonListener {
    func target(tag: String, label: UILabel) {
        switch tag {
        case "1":
            print("1")
            label.text = "A" + label.text!
        case "2":
            print("2")
            label.text = "B" + label.text!
        case "3":
            print("3")
            label.text = "C" + label.text!
        default:
            print("nil")
        }
    }
}
