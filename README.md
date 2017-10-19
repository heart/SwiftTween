![SwiftTween Logo](https://github.com/heart/SwiftTween/blob/master/images/logo.png?raw=true)



# SwiftTween

[![CI Status](http://img.shields.io/travis/heart/SwiftTween.svg?style=flat)](https://travis-ci.org/heart/SwiftTween)
[![Version](https://img.shields.io/cocoapods/v/SwiftTween.svg?style=flat)](http://cocoapods.org/pods/SwiftTween)
[![License](https://img.shields.io/cocoapods/l/SwiftTween.svg?style=flat)](http://cocoapods.org/pods/SwiftTween)
[![Platform](https://img.shields.io/cocoapods/p/SwiftTween.svg?style=flat)](http://cocoapods.org/pods/SwiftTween)

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
let t = SwiftTween()
        
t.onUpdate = {
    (value:Double,timePassed:Double,finish:Bool)->Void in

    let f = self.dot.frame
    self.dot.frame = CGRect(x:CGFloat(value-20) ,
                            y:CGFloat(200-value),
                            width:f.size.width,
                            height:f.size.height)

    if finish {
    	print("Tween Finished")
    }else{
    	print("Time Passed > \(timePassed)")
    }

}

t.to(startValue:0, endValue:200 , timeDuration:1 , ease:Ease.Linear )
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
