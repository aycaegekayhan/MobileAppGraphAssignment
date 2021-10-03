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
        label.text = "Activity Hours"
        label.font = .systemFont(ofSize: 36, weight: .light)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label.sizeToFit()
        view.addSubview(label)
        label.center = view.center
        
        let circlePath = UIBezierPath(arcCenter: view.center, radius: 150, startAngle: -(Double.pi/2), endAngle: (Double.pi) * 2, clockwise: true)
    
        
        shape.path = circlePath.cgPath
        shape.lineWidth = 15
        shape.strokeColor = UIColor.gray.cgColor
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeEnd = 0
        view.layer.addSublayer(shape)
        
        let button = UIButton(frame: CGRect(x: 20, y: view.frame.size.width-250, width: view.frame.size.width-40, height: 50))
        
        view.addSubview(button)
        button.setTitle("Animate", for: .normal)
        button.backgroundColor = .systemGreen
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }
    
    @objc func didTapButton() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 3
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        shape.add(animation, forKey: "animation")
    }
  
}

