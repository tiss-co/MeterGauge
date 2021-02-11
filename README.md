

# Requirements
- Xcode 11+
- Swift 5
- iOS 10.0+


# Installation


## Cocoapods
```ruby
pod 'MeterGauge'
```

# Usage

### Import GDGauge
```swift
import MeterGauge
```

### Create an instance of Meter Gauge
```swift
var gaugeView: MeterGauge = MeterGauge(frame: view.bounds)

```
### Setup Segment
```swift
let color = UIColor(red: 0.3, green: 0.5, blue: 0.2, alpha: 1.0)
let segment = Segment(percent: 100, color: color, status: "")
guageView.segments.append(segment)
```

### To update value
```swift
gaugeView.set(value : Int)
```

### Setup, customize gauge
```swift 
//Value
gaugeView.valueFont = UIFont.systemFont(ofSize: 28, weight: .heavy)
gaugeView.valueTextColor = UIColor.black

//Description
gaugeView.descriptionFont = UIFont.systemFont(ofSize: 28, weight: .heavy)
gaugeView.descriptionTextColor = UIColor.black

//Center Circle
gaugeView.centerCircleBackgroundColor = UIColor.clear
gaugeView.centerCircleBorderWidth = 3.0

//Ticks
gaugeView.tickWidth = 7.0
gaugeView.beforeIndicatorTickOpacity = 1.0
gaugeView.afterIndicatorTickOpacity = 0.3

//Indicator Tick Width
gaugeView.indicatorTickHeight = 10.0
gaugeView.indicatorTickScale = 1.0
gaugeView.indicatorTickOpacity = 1.0

```

## Licence
Meter Gauge is available under the MIT license.


