//
//  MeterGauge.swift
//  MeterGauge
//
//  Created by Amir on 2/4/21.
//

import UIKit


public final class MeterGauge: UIView {

    fileprivate var meterGaugeView : MeterGaugeView = MeterGaugeView()
    
    public var segments : [Segment] = [] {
        didSet {
            meterGaugeView.segments = segments
        }
    }
    
    public var gaugeBackgroundColor : UIColor = .clear
    public var valueFont : UIFont = .systemFont(ofSize: 28, weight: .heavy)
    public var valueTextColor : UIColor = .black
    public var descriptionFont : UIFont = .systemFont(ofSize: 18, weight: .regular)
    public var descriptionTextColor : UIColor = .black
    public var centerCircleBorderWidth : CGFloat = 3.0
    public var centerCircleBackgroundColor : UIColor = .clear
    public var tickWidth : CGFloat = 7.0
    public var indicatorTickHeight : CGFloat = 10
    public var indicatorTickOpacity : CGFloat = 1.0
    public var indicatorTickScale : CGFloat = 1.0
    public var beforeIndicatorTickOpacity : CGFloat = 1.0
    public var afterIndicatorTickOpacity : CGFloat = 0.3
    
    var value: Int = 0
    
    
    public override init (frame : CGRect){
        super.init(frame: frame)
        addGuageView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        refreshUI()
    }
    
    public override func draw(_ rect: CGRect) {
        addGuageView()
    }
    
    public func addGuageView(){
        meterGaugeView.removeFromSuperview()
        let widthAndHeight = min(frame.size.width, frame.size.height)
        let bounds = CGRect(x: 0, y: 0, width: widthAndHeight, height: widthAndHeight)
        meterGaugeView = MeterGaugeView(frame: bounds)
        self.addSubview(meterGaugeView)
        meterGaugeView.set(value: value)
        meterGaugeView.segments = segments
        refreshUI()
    }
    
    public func refreshUI() {
        meterGaugeView.backgroundColor = gaugeBackgroundColor
        meterGaugeView.valueFont = valueFont
        meterGaugeView.valueColor = valueTextColor
        meterGaugeView.descriptionFont = descriptionFont
        meterGaugeView.descriptionColor = descriptionTextColor
        meterGaugeView.centerCircleBorderWidth = centerCircleBorderWidth
        meterGaugeView.centerCircleBgColor = centerCircleBackgroundColor
        meterGaugeView.tickWidth = tickWidth
        meterGaugeView.indicatorTickHeight = indicatorTickHeight
        meterGaugeView.indicatorTickOpacity = indicatorTickOpacity
        meterGaugeView.indicatorTickScale = indicatorTickScale
        meterGaugeView.beforeIndicatorTickOpacity = beforeIndicatorTickOpacity
        meterGaugeView.afterIndicatorTickOpacity = afterIndicatorTickOpacity
        meterGaugeView.setup()
    }
    
    public func set(value : Int){
        self.value = value
        meterGaugeView.set(value: value)
    }
    
}
