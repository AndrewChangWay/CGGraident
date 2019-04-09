//
//  ViewController3.swift
//  渐变色
//
//  Created by zzq on 2018/5/31.
//  Copyright © 2018年 zzq. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.addSubview(MView(frame: CGRect(x: 0, y: 64, width: 300, height: 250)))
        self.view.addSubview(YView(frame: CGRect(x: 0, y: 320, width: 370, height: 300)))
        // 测试
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
class MView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ rect: CGRect) {
        
        guard let cxt = UIGraphicsGetCurrentContext() else {
            return
        }
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colorArray = [UIColor.randomColor().cgColor,
                          UIColor.randomColor().cgColor,
                          UIColor.randomColor().cgColor
        ]
        let locations: [CGFloat] = [0.0, 0.45, 1]
        var compoents: [CGFloat] = []
        
        for i in 0..<colorArray.count {
            for j in 0..<4 {
                compoents.append(colorArray[i].components![j])
            }
        }
        let center = CGPoint(x: self.bounds.size.width*0.5, y: self.bounds.size.height*0.5)
        cxt.addPath(UIBezierPath(arcCenter: center, radius: 100, startAngle: 0, endAngle: .pi*2, clockwise: true).cgPath)
        cxt.clip()
        
        let gradient = CGGradient.init(colorSpace: colorSpace, colorComponents: compoents, locations: locations, count: locations.count)
        
        cxt.drawLinearGradient(gradient!, start: CGPoint(x: 0, y: 0), end: CGPoint(x: self.bounds.size.width, y: 0), options: .drawsAfterEndLocation)
    }
}
class YView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ rect: CGRect) {
        
        guard let cxt = UIGraphicsGetCurrentContext() else {
            return
        }
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colorArray = [UIColor.randomColor().cgColor,
                          UIColor.randomColor().cgColor,
                          UIColor.randomColor().cgColor
        ]
        let locations: [CGFloat] = [0.0, 0.45, 1]
        var compoents: [CGFloat] = []
        
        for i in 0..<colorArray.count {
            for j in 0..<4 {
                compoents.append(colorArray[i].components![j])
            }
        }

        let path = CGMutablePath()
        
        let p1 = CGPoint(x: 50, y: 50)
        let p2 = CGPoint(x: 150, y: 50)
        let p3 = CGPoint(x: 175, y: 50)
        let p4 = CGPoint(x: 200, y: 50)
        let p5 = CGPoint(x: 300, y: 50)
        let p6 = CGPoint(x: 300, y: 150)
        let p7 = CGPoint(x: 50, y: 150)
        path.move(to: p1)
        path.addLine(to: p2)
        
        path.addArc(center: p3, radius: 25, startAngle: -.pi, endAngle: 0, clockwise: true)
        //        path.addLine(to: p4)
        path.addLine(to: p5)
        path.addLine(to: p6)
        path.addLine(to: p7)
        path.addLine(to: p1)
        
        
        
        cxt.addPath(path)
        cxt.clip()
        
        let gradient = CGGradient.init(colorSpace: colorSpace, colorComponents: compoents, locations: locations, count: locations.count)
        
        cxt.drawLinearGradient(gradient!, start: CGPoint(x: 0, y: 0), end: CGPoint(x: self.bounds.size.width, y: 0), options: .drawsAfterEndLocation)
    }
}
