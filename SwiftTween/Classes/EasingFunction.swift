//
//  EasingFunction.swift
//  FBSnapshotTestCase
//
//  Created by narongrit kanhanoi on 19/10/2560 BE.
//

import UIKit

public class EasingFunction: NSObject {
    //Thanks easing function from https://github.com/danro/jquery-easing
    // t: current time, b: beginning value, _c: final value, d: total duration
    public static func getValue(e:Ease, t:Double, b:Double, _c:Double, d:Double)->Double{
        var t = t
        switch e {
        case .Linear:
            let c = _c - b
            return c * t / d + b
        case .InQuad:
            let c = _c - b
            t /= d
            return c * t * t + b
        case .OutQuad:
            let c = _c - b
            t /= d
            return -c * t * (t - 2) + b
        case .InOutQuad:
            let c = _c - b;
            t /= d
            if ( t / 2 < 1) {
                return c / 2 * t * t + b;
            } else {
                return -c / 2 * ( t - 1 * (t - 1 - 2) - 1) + b;
            }
        case .InCubic:
            let c = _c - b;
            t /= d
            return c * t * t * t + b;
        case .OutCubic:
            let c = _c - b;
            t = t / d - 1
            return c * ( t * t * t + 1) + b;
        case .InOutCubic:
            let c = _c - b;
            t /= d
            if ( t / 2 < 1) {
                return c / 2 * t * t * t + b;
            } else {
                t -= 2
                return c / 2 * ( t * t * t + 2) + b;
            }
        case .InQuart:
            let c = _c - b;
            t /= d
            return c * t * t * t * t + b;
        case .OutQuart:
            let c = _c - b;
            t = t / d - 1
            return -c * (t * t * t * t - 1) + b;
        case .InOutQuart:
            let c = _c - b;
            t /= d
            if ( t / 2 < 1) {
                return c / 2 * t * t * t * t + b;
            } else {
                t -= 2
                return -c / 2 * ( t * t * t * t - 2) + b;
            }
        case .InQuint:
            let c = _c - b
            t /= d
            return c * t * t * t * t * t + b
        case .OutQuint:
            let c = _c - b
            t = t / d - 1
            return c * (t * t * t * t * t + 1) + b;
        case .InOutQuint:
            let c = _c - b;
            t /= d
            if (t / 2 < 1) {
                return c / 2 * t * t * t * t * t + b;
            } else {
                t -= 2
                return c / 2 * (t * t * t * t * t + 2) + b;
            }
        case .InSine:
            let c = _c - b;
            return -c * cos(t / d * (Double.pi / 2)) + c + b;
        case .OutSine:
            let c = _c - b;
            return c * sin(t / d * (Double.pi / 2)) + b;
        case .InOutSine:
            let c = _c - b;
            return -c / 2 * (cos(Double.pi * t / d) - 1) + b;
        case .InExpo:
            let c = _c - b;
            return (t==0) ? b : c * pow(2, 10 * (t/d - 1)) + b;
        case .OutExpo:
            let c = _c - b;
            return (t==d) ? b+c : c * (-pow(2, -10 * t/d) + 1) + b;
        case .InOutExpo:
            let c = _c - b;
            if (t == 0) {
                return b;
            }
            if (t == d) {
                return b + c;
            }
            t /= d
            if ( t / 2 < 1) {
                return c / 2 * pow(2, 10 * (t - 1)) + b;
            } else {
                t -= 1
                return c / 2 * ( -pow(2, -10 * t ) + 2) + b;
            }
        case .InCirc:
            let c = _c - b;
            t /= d
            return -c * ( sqrt(1 - t * t) - 1) + b;
        case .OutCirc:
            let c = _c - b;
            t = t / d - 1
            return c * sqrt(1 - t * t) + b;
        case .InOutCirc:
            let c = _c - b;
            t /= d
            if ( t / 2 < 1) {
                return -c / 2 * (sqrt(1 - t * t) - 1) + b;
            } else {
                t -= 2
                return c / 2 * (sqrt(1 - t * t) + 1) + b;
            }
        case .InElastic:
            let c = _c - b;
            
            if (t == 0) {
                return b;
            } else if ( t / d == 1) {
                return b + c;
            }
            
            var a:Double = c
            let p:Double = d * 0.3
            var s:Double
            t /= d
            
            if (a < abs(c)) {
                a = c;
                s = p / 4;
            } else {
                s = p / (2 * Double.pi) * asin(c / a);
            }
            t -= 1
            return -(a * pow(2, 10 * t) * sin((t * d - s) * (2 * Double.pi) / p)) + b;
        case .OutElastic:
            let c = _c - b;
            
            if (t == 0) {
                return b;
            } else if (t / d == 1) {
                return b + c;
            }
            
            t /= d
            
            var s:Double
            let p:Double = d * 0.3
            var a:Double = c
            
            if (a < abs(c)) {
                a = c;
                s = p / 4;
            } else {
                s = p / (2 * Double.pi) * asin(c / a);
            }
            return a * pow(2, -10 * t) * sin((t * d - s) * (2 * Double.pi) / p) + c + b;
        case .InOutElastic:
            let c = _c - b;
            
            if (t == 0) {
                return b;
            } else if ( (t / d / 2) == 2) {
                return b + c;
            }
            
            t /= d
            
            var s:Double;
            let p = d * (0.3 * 1.5);
            var a:Double = c;
            
            if (a < abs(c)) {
                a = c;
                s = p / 4;
            } else {
                s = p / (2 * Double.pi) * asin(c / a);
            }
            
            if (t < 1) {
                t -= 1
                return -0.5 * (a * pow(2, 10 * t ) * sin((t * d - s) * (2 * Double.pi) / p)) + b;
            } else {
                t -= 1
                return a * pow(2, -10 * t) * sin((t * d - s) * (2 * Double.pi) / p) * 0.5 + c + b;
            }
        case .InBack:
            let c = _c - b;
            let s:Double = 1.70158
            t /= d
            let m =  Double( s + 1.0 ) * Double( t - s )
            return c * t * t * m + b;
        case .OutBack:
            let c = _c - b;
            let s:Double = 1.70158;
            t = t / d - 1
            return c * (t * t * ((s + 1) * t + s) + 1) + b;
        case .InOutBack:
            let c = _c - b;
            var s:Double = 1.70158;
            t /= d
            if ( t / 2 < 1) {
                s *= 1.525
                let m = ( t * t * ( ( s + 1 ) * t - s) )
                return c / 2 * m + b;
            } else {
                s *= 1.525
                t -= 2
                return c / 2 * (t * t * (( s + 1) * t + s) + 2) + b;
            }
        case .InBounce:
            let c = _c - b;
            let v = EasingFunction.getValue(e: .OutBounce, t: d - t, b: 0, _c: c, d: d)
            return c - v + b;
        case .OutBounce:
            let c = _c - b;
            t /= d
            if ( t < 1 / 2.75) {
                return c * (7.5625 * t * t) + b;
            } else if (t < 2 / 2.75) {
                t -= 1.5
                return c * (7.5625 * (t / 2.75) * t + 0.75) + b;
            } else if (t < 2.5 / 2.75) {
                t -= 2.25
                return c * (7.5625 * (t / 2.75) * t + 0.9375) + b;
            } else {
                t -= 2.625
                return c * (7.5625 * (t / 2.75) * t + 0.984375) + b;
            }
        case .InOutBounce:
            let c = _c - b;
            var v:Double
            if (t < d / 2) {
                v = EasingFunction.getValue(e: .OutBounce, t: t * 2, b: 0, _c: c, d: d)
                
                return v * 0.5 + b;
            } else {
                v = EasingFunction.getValue(e: .OutBounce, t: t * 2 - d, b: 0, _c: c, d: d)
                return v * 0.5 + c * 0.5 + b;
            }
        }
        
    }
}
