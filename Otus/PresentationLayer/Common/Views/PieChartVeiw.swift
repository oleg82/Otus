//
//  PieChartVeiw.swift
//  Otus
//
//  Created by Олег Иванов on 25/06/2019.
//  Copyright © 2019 Олег Иванов. All rights reserved.
//

import UIKit

struct Segment {
    let color: UIColor
    let title: String
}

extension CGFloat {
    func toRadians() -> CGFloat {
        return self * CGFloat(Double.pi) / 180.0
    }
}

class CircleLayer: CAShapeLayer {
    private static let keyAnimation = "strokeEndAnimation"
    
    func addPath(startPoint: CGPoint, radius: CGFloat, fillColor: UIColor) {
        
        
        let startAngle:CGFloat = (30-90).toRadians()
        let endAngle:CGFloat = (150-90).toRadians()
        let path = UIBezierPath(arcCenter: CGPoint(x: 0,y :0), radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        self.position = startPoint
        self.lineWidth = radius*2
        self.path = path.cgPath
        
//        self.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 2.0 * radius, height: 2.0 * radius), cornerRadius: radius).cgPath
//        self.position = CGPoint(x: startPoint.x - radius, y: startPoint.y - radius)
//        self.fillColor = fillColor.cgColor
    }
    
    func startAnimate() {
        let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimation.duration = 10.0;
        pathAnimation.fromValue = 0.0;
        pathAnimation.toValue = 1.0;
        self.add(pathAnimation, forKey: CircleLayer.keyAnimation)
    }
    
    func stopAnimate() {
        self.removeAnimation(forKey: CircleLayer.keyAnimation)
    }
}

class PieChartVeiw: UIView {
    let circleLayer = CircleLayer()
    var fromAngle:CGFloat = 30
    var toAngle:CGFloat = 150
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        circleLayer.strokeColor = UIColor.black.cgColor
        layer.addSublayer(circleLayer)
        layer.backgroundColor = UIColor.clear.cgColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = min(bounds.width, bounds.height) / 4
        
        circleLayer.addPath(startPoint: center, radius: radius, fillColor: UIColor.blue)
        circleLayer.startAnimate()
    }
}
