//
//  ViewController.swift
//  DesignSwift
//
//  Created by Ayça ege Kayhan on 10/1/21.
//

import UIKit

class ViewController: UIViewController {
    
    let shape = CAShapeLayer()
    
    private let text: UILabel = {
        let text = UILabel()
        text.text = "GOOD MORNING"
        text.font = .systemFont(ofSize: 30, weight: .light)
        text.textAlignment = .center
        return text
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        text.sizeToFit()
        view.addSubview(text)
        text.center = view.center
        
        shape.path = UIBezierPath(arcCenter: CGPoint(x: view.frame.size.width/2, y: view.frame.size.height/2),
                                radius: 150,
                                startAngle: CGFloat(110.0),
                                endAngle: CGFloat(0.0),
                                clockwise: true).cgPath
        
        shape.lineWidth = 15
        shape.strokeColor = UIColor.yellow.cgColor
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeEnd = 0
        view.layer.addSublayer(shape)
        
        let button = UIButton(frame: CGRect(x: 20, y: view.frame.size.width+60,
                                            width: view.frame.size.width-40,
                                            height: 50))
        
        view.addSubview(button)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.setTitle("Click to See The Sun", for: .normal)
        button.backgroundColor = .systemOrange
        
    }
    
    @objc func buttonAction() {
        let action = CABasicAnimation(keyPath: "strokeEnd")
        action.isRemovedOnCompletion = false
        action.fillMode = .forwards
        action.toValue = 1
        action.duration = 2
        shape.add(action, forKey: "action")
    }
  
}

