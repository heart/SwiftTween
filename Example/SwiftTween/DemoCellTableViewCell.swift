//
//  DemoCellTableViewCell.swift
//  SwiftTween_Example
//
//  Created by narongrit kanhanoi on 19/10/2560 BE.
//  Copyright © 2560 CocoaPods. All rights reserved.
//

import UIKit
import SwiftTween


class DemoCellTableViewCell: UITableViewCell {

    @IBOutlet weak var dot: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var canvas: UIView!
    
    var lineLayer:CAShapeLayer? = nil
    var ease:Ease?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func clickReplay(_ sender: Any) {
        let t = SwiftTween()
        
        t.onUpdate = {
            (value:Double,timePassed:Double,finish:Bool)->Void in
            
            let f = self.dot.frame
            self.dot.frame = CGRect(x:CGFloat(value-20) ,
                                    y:CGFloat(200-value),
                                    width:f.size.width,
                                    height:f.size.height)
        }
        
        t.to(startValue:0, endValue:200 , timeDuration:1 , ease:self.ease )
    }
    
    public func setEasing(ease:Ease?){
        self.ease = ease
        
        let aPath = UIBezierPath()
        aPath.move(to: CGPoint(x: 0.0, y: 200.0 ))
        
        for i in 0...200 {
            let result = EasingFunction.getValue(ease:self.ease! ,
                                    currentTime:Double(i),
                                    beginningValue:0,
                                    finalValue:200.0,
                                    totalDuration:200.0)
            
            aPath.addLine(to: CGPoint(x:i, y:Int(200.0-result) ) )
            
        }
        
        lineLayer?.removeFromSuperlayer()
        
        self.lineLayer = CAShapeLayer()
        self.lineLayer?.path = aPath.cgPath
        
        self.lineLayer?.strokeColor = UIColor.blue.cgColor
        self.lineLayer?.fillColor = UIColor.clear.cgColor
        
        self.lineLayer?.lineWidth = 1.0
        self.lineLayer?.position = CGPoint(x: 0, y: 0)
        if let l = self.lineLayer{
            self.canvas.layer.addSublayer(l)
        }
        
    }
    
}
