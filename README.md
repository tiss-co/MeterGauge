![MeterGaugeBanner](https://user-images.githubusercontent.com/35375629/107658858-cd98b580-6c9b-11eb-9542-a26f2061693a.jpg)

# Requirements
- Xcode 11+
- Swift 5
- iOS 10.0+


# Installation


## Cocoapods
```ruby
pod 'MeterGauge', :git => 'git@github.com:boof-tech/MeterGauge.git', :tag => '0.0.2'
```

# Usage

### Import MeterGauge
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
![demo](https://user-images.githubusercontent.com/35375629/107660125-29b00980-6c9d-11eb-831e-a4ee3ea15d81.gif)
```swift
gaugeView.set(value : Int)
```

### Customize gauge

- Value
```swift 
gaugeView.valueFont = UIFont.systemFont(ofSize: 28, weight: .heavy)
gaugeView.valueTextColor = UIColor.black
```
- Description
```swift 
gaugeView.descriptionFont = UIFont.systemFont(ofSize: 28, weight: .heavy)
gaugeView.descriptionTextColor = UIColor.black
```
- Center Circle
```swift 
gaugeView.centerCircleBackgroundColor = UIColor.clear
gaugeView.centerCircleBorderWidth = 3.0
```
- Ticks
```swift 
gaugeView.tickWidth = 7.0
gaugeView.beforeIndicatorTickOpacity = 1.0
gaugeView.afterIndicatorTickOpacity = 0.3
```
- Indicator Tick Width
```swift 
gaugeView.indicatorTickHeight = 10.0
gaugeView.indicatorTickScale = 1.0
gaugeView.indicatorTickOpacity = 1.0
```

## Licence
Meter Gauge is available under the MIT license. See the [LICENSE.txt](https://github.com/boof-tech/MeterGauge/blob/main/LICENSE) file for more info.


