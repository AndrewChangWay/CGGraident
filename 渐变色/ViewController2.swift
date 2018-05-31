//
//  ViewController2.swift
//  渐变色
//
//  Created by zzq on 2018/5/31.
//  Copyright © 2018年 zzq. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.addSubview(TestView(frame: CGRect(x: 0, y: 64, width: 300, height: 300)))
        
         self.view.addSubview(RectView(frame: CGRect(x: 0, y: 400, width: 300, height: 300)))
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
class TestView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ rect: CGRect) {
        
        guard let cxt = UIGraphicsGetCurrentContext() else {
            return
        }
//        let cxt:CGContext? = UIGraphicsGetCurrentContext()
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colorArray = [UIColor.randomColor().cgColor,
                          UIColor.randomColor().cgColor,
                          UIColor.randomColor().cgColor,
                          UIColor.randomColor().cgColor,
                          UIColor.randomColor().cgColor,
                          UIColor.randomColor().cgColor,
                          UIColor.randomColor().cgColor,
                          UIColor.randomColor().cgColor
        ]
        let locations: [CGFloat] = [0.0, 0.2, 0.3, 0.45, 0.6, 0.7, 0.85, 1]
        var compoents: [CGFloat] = []
        
        for i in 0..<colorArray.count {
            for j in 0..<4 {
                compoents.append(colorArray[i].components![j])
            }
        }
        let gradient = CGGradient.init(colorSpace: colorSpace, colorComponents: compoents, locations: locations, count: locations.count)
        //外圆半径
        let endRadius = min(self.bounds.width, self.bounds.height) / 2
        //内圆半径
        let startRadius = endRadius / 5
        let center = CGPoint(x: self.bounds.size.width*0.5, y: self.bounds.size.height*0.5)
        
        cxt.drawRadialGradient(gradient!, startCenter: center, startRadius: startRadius, endCenter: center, endRadius: endRadius, options: .drawsAfterEndLocation)
        
        
    }
}
class RectView: UIView {
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
        let rect1 = CGRect(x: 0, y: 0,
                           width: self.bounds.width/4, height: self.bounds.height/2)
        let rect2 = CGRect(x: self.bounds.maxX/4, y: self.bounds.maxY/2,
                           width: self.bounds.width/4, height: self.bounds.height/2)
        let rect3 = CGRect(x: self.bounds.maxX/2, y: 0,
                           width: self.bounds.width/4, height: self.bounds.height/2)
        let rect4 = CGRect(x: self.bounds.maxX/4*3, y: self.bounds.maxY/2,
                           width: self.bounds.width/4, height: self.bounds.height/2)
        cxt.clip(to: [rect1, rect2, rect3, rect4])
        let gradient = CGGradient.init(colorSpace: colorSpace, colorComponents: compoents, locations: locations, count: locations.count)
        
        cxt.drawLinearGradient(gradient!, start: CGPoint(x: 0, y: 0), end: CGPoint(x: self.bounds.size.width, y: 0), options: .drawsAfterEndLocation)
    }
}
