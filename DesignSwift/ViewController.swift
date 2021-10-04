//
//  ViewController.swift
//  DesignSwift
//
//  Created by Ayça ege Kayhan on 10/1/21.
//

import UIKit

class ViewController: UIViewController {
    
    let shape = CAShapeLayer()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "GOOD MORNING"
        label.font = .systemFont(ofSize: 36, weight: .light)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label.sizeToFit()
        view.addSubview(label)
        label.center = view.center
        
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
        button.setTitle("Click to See The Sun", for: .normal)
        button.backgroundColor = .systemOrange
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
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

