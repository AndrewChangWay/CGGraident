//
//  ViewController.swift
//  渐变色
//
//  Created by zzq on 2018/5/31.
//  Copyright © 2018年 zzq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.test1()
        self.test2()
//        self.test3()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func test3() {
        UIGraphicsBeginImageContext(CGSize(width: 200, height: 200))
        let ctx: CGContext? = UIGraphicsGetCurrentContext()
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let locations: [CGFloat] = [0.0, 1.0]
        let colors = [UIColor.red.cgColor.components,
                      UIColor.cyan.cgColor.components,
                      UIColor.orange.cgColor.components]
        
        let gradient: CGGradient? = CGGradient.init(colorsSpace: colorSpace, colors: colors as CFArray, locations: locations)
        ctx?.drawLinearGradient(gradient!, start: CGPoint(x: 0, y: 0), end: CGPoint(x: 1, y: 1), options: CGGradientDrawingOptions.drawsAfterEndLocation)
        let image: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.view.addSubview(UIImageView(image: image))
    }
    func test1() {
        let v1 = UIView(frame: CGRect(x: 50, y: 70, width: 250, height: 250))
        self.view.addSubview(v1)
        
        let ca = CAGradientLayer()
        ca.frame = v1.bounds
        v1.layer.addSublayer(ca)
        
        ca.colors = [UIColor.randomColor().cgColor,
                     UIColor.randomColor().cgColor,
                     UIColor.randomColor().cgColor,
                     UIColor.randomColor().cgColor,
                     UIColor.randomColor().cgColor,
                     UIColor.randomColor().cgColor,
                     UIColor.randomColor().cgColor]
        ca.locations = [0.0, 0.2, 0.4, 0.5, 0.8, 1]
        ca.startPoint = CGPoint(x: 0, y: 0)
        ca.startPoint = CGPoint(x: 1, y: 1)
        
        let shape = CAShapeLayer()
        shape.path = UIBezierPath(arcCenter: CGPoint(x: 125, y: 125), radius: 120, startAngle: 0, endAngle: .pi*2, clockwise: true).cgPath
        shape.lineWidth = 4
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeColor = UIColor.cyan.cgColor
        
        v1.layer.mask = shape
        
    }
    
    
    func test2() {
        self.view.addSubview(ZQView(frame: CGRect(x: 50, y: 350, width: 250, height: 200)))
    }
    
}

extension UIColor {
    class func randomColor() -> UIColor {
        let r = CGFloat(arc4random_uniform(255))
        let g = CGFloat(arc4random_uniform(255))
        let b = CGFloat(arc4random_uniform(255))
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
    }
    class func rgba(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
}

class ZQView: UIView {
    
    override func draw(_ rect: CGRect) {
        
        let ctx: CGContext? = UIGraphicsGetCurrentContext()
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let locations: [CGFloat] = [0.0, 0.33, 0.5, 0.8, 1.0]
        let colors = [UIColor.randomColor(),
                      UIColor.randomColor(),
                      UIColor.randomColor(),
                      UIColor.randomColor(),
                      UIColor.randomColor()]
        
        var colo:[CGFloat]? = []//colors[0].cgColor.components;
//        let components = newColor1.cgColor.components;
        for i in 0..<colors.count {
            let cc = colors[i].cgColor
            
            for j in 0..<4 {
                colo?.append(cc.components![j])
            }
            
        }
       
        let gradient:CGGradient? = CGGradient.init(colorSpace:colorSpace, colorComponents:colo!,
                                                   locations:locations, count:locations.count);
        ctx?.drawLinearGradient(gradient!, start:CGPoint.init(x:self.bounds.size.width, y:0.0), end: CGPoint.init(x:1, y:self.bounds.size.height),
                                options: CGGradientDrawingOptions.drawsAfterEndLocation);

    }
    
    
    
    func drawLineGradient(ctx: CGContext?)  {
        let ctx: CGContext? = UIGraphicsGetCurrentContext()
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let locations: [CGFloat] = [0.0, 1.0]
        let colors = [UIColor.red.cgColor,
                      UIColor.cyan.cgColor,
                      UIColor.orange.cgColor]
        
        let gradient: CGGradient? = CGGradient.init(colorsSpace: colorSpace, colors: colors as CFArray, locations: locations)
        ctx?.drawLinearGradient(gradient!, start: CGPoint(x: 0, y: 0), end: CGPoint(x: 1, y: 1), options: CGGradientDrawingOptions.drawsAfterEndLocation)
    }
}
