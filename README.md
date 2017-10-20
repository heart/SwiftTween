![SwiftTween Logo](https://github.com/heart/SwiftTween/blob/master/images/logo.png?raw=true)



# SwiftTween

[![CI Status](http://img.shields.io/travis/heart/SwiftTween.svg?style=flat)](https://travis-ci.org/heart/SwiftTween)
[![Version](https://img.shields.io/cocoapods/v/SwiftTween.svg?style=flat)](http://cocoapods.org/pods/SwiftTween)
[![License](https://img.shields.io/cocoapods/l/SwiftTween.svg?style=flat)](http://cocoapods.org/pods/SwiftTween)
[![Platform](https://img.shields.io/cocoapods/p/SwiftTween.svg?style=flat)](http://cocoapods.org/pods/SwiftTween)

SwiftTween is a lightweight value tweener easy to use.



## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

### the Example project
![SwiftTween Example app](https://github.com/heart/SwiftTween/blob/master/images/example_app.png?raw=true)


## Requirements
Swift 4.0


## Installation

SwiftTween is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SwiftTween'
```

## Example
```swift
let view = UIView()
view.layer.backgroundColor = UIColor.red.cgColor
view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)

let t = SwiftTween()
        
t.onUpdate = {
    (value:Double,timePassed:Double,finish:Bool)->Void in

    let f = view.frame

    view.frame = CGRect(x:CGFloat(value-20) ,
                            y:CGFloat(200-value),
                            width:f.size.width,
                            height:f.size.height)

    if finish {
    	print("Tween Finished")
    }else{
    	print("Time Passed > \(timePassed)")
    }

}

t.tween(startValue:0, endValue:200 , timeDuration:1 , ease:Ease.Linear )
```

## You can get the tween value at any spot of the timline
```swift
let duration = 20
let currentTime = 10
let beginningValue = 0
let finalValue = 100

let value_At_Half_Of_Timeline = EasingFunction.getValue( 
				ease:Ease.Linear, 
				currentTime: currentTime, 
				beginningValue: beginningValue, 
				finalValue: finalValue , 
				totalDuration:duration )

print( value_At_Half_Of_Timeline ) //print 50 because it's a Linear easing
```

## You also can get the ratio of value at any spot of the timline
```swift
let timelineRatio = 0.5

let value_Ratio_At_Half_Of_Timeline = EasingFunction.getRatio(ease:Ease.Linear,  timeRatio:timelineRatio )

print( value_At_Half_Of_Timeline ) //print 0.5 because it's a Linear easing
```


## Easing Type
```swift
Ease.Linear
Ease.InQuad
Ease.OutQuad
Ease.InOutQuad
Ease.InCubic
Ease.OutCubic
Ease.InOutCubic
Ease.InQuart
Ease.OutQuart
Ease.InOutQuart
Ease.InQuint
Ease.OutQuint
Ease.InOutQuint
Ease.InSine
Ease.OutSine
Ease.InOutSine
Ease.InExpo
Ease.OutExpo
Ease.InOutExpo
Ease.InCirc
Ease.OutCirc
Ease.InOutCirc
Ease.InElastic
Ease.OutElastic
Ease.InOutElastic
Ease.InBack
Ease.OutBack
Ease.InOutBack
Ease.InBounce
Ease.OutBounce
Ease.InOutBounce
```


## Author

i am Heart, narongrit@3dsinteractive.com

## License

SwiftTween is available under the MIT license. See the LICENSE file for more info.
