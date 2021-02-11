

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

### To update the handle value
```swift
gaugeView.set(value : Int)
```

### Setup, customize gauge
```swift 
gaugeView.valueFont = UIFont.systemFont(ofSize: 28, weight: .heavy)
gaugeView.
        
```

## Licence
GDGauge is available under the MIT license.


