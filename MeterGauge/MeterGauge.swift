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
    
    public var gaugeBackgroundColor : UIColor = .clear {
        didSet {
            meterGaugeView.backgroundColor = gaugeBackgroundColor
        }
    }
    
    public var valueFont : UIFont = .systemFont(ofSize: 28, weight: .heavy){
        didSet {
            meterGaugeView.valueFont = valueFont
        }
    }
    
    public var valueTextColor : UIColor = .black{
        didSet {
            meterGaugeView.valueColor = valueTextColor
        }
    }
    
    public var descriptionFont : UIFont = .systemFont(ofSize: 18, weight: .regular){
        didSet {
            meterGaugeView.descriptionFont = descriptionFont
        }
    }

    public var descriptionTextColor : UIColor = .black{
        didSet {
            meterGaugeView.descriptionColor = descriptionTextColor
        }
    }
    
    public var centerCircleBorderWidth : CGFloat = 3.0 {
        didSet {
            meterGaugeView.centerCircleBorderWidth = centerCircleBorderWidth
        }
    }
    
    public var centerCircleBackgroundColor : UIColor = .clear {
        didSet {
            meterGaugeView.centerCircleBgColor = centerCircleBackgroundColor
        }
    }
    
    public var tickWidth : CGFloat = 7.0 {
        didSet {
            meterGaugeView.tickWidth = tickWidth
        }
    }
    
    public var indicatorTickHeight : CGFloat = 10 {
        didSet {
            meterGaugeView.indicatorTickHeight = indicatorTickHeight
        }
    }
    
    public var indicatorTickOpacity : CGFloat = 1.0 {
        didSet {
            meterGaugeView.indicatorTickOpacity = indicatorTickOpacity
        }
    }
    
    public var indicatorTickScale : CGFloat = 1.0 {
        didSet {
            meterGaugeView.indicatorTickScale = indicatorTickScale
        }
    }
    
    public var beforeIndicatorTickOpacity : CGFloat = 1.0 {
        didSet {
            meterGaugeView.beforeIndicatorTickOpacity = beforeIndicatorTickOpacity
        }
    }
    
    public var afterIndicatorTickOpacity : CGFloat = 0.3 {
        didSet {
            meterGaugeView.afterIndicatorTickOpacity = afterIndicatorTickOpacity
        }
    }
    
    
    public override init (frame : CGRect){
        super.init(frame: frame)
        addGuageView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        meterGaugeView.setup()
    }
    
    public override func draw(_ rect: CGRect) {
        addGuageView()
    }
    
    func addGuageView(){
        meterGaugeView.removeFromSuperview()
        let widthAndHeight = min(frame.size.width, frame.size.height)
        let bounds = CGRect(x: 0, y: 0, width: widthAndHeight, height: widthAndHeight)
        meterGaugeView = MeterGaugeView(frame: bounds)
        gaugeBackgroundColor = UIColor.clear
        self.addSubview(meterGaugeView)
    }
    
    
    public func set(value : Int){
        meterGaugeView.set(value: value)
    }
    
}
