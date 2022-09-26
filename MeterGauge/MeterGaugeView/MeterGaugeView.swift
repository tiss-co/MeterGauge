//
//  Created by Amir on 8/31/20.
//  Copyright © 2020 AmirhMemarian. All rights reserved.
//

import UIKit

class MeterGaugeView: UIView {
    
    //MARK : Variable
    //Center Circle
    let centerCircleView = UIView()
    var centerCircleBorderWidth : CGFloat = 3.0{
        didSet {
            centerCircleView.layer.borderWidth = centerCircleBorderWidth
        }
    }
    
    var centerCircleBgColor = UIColor.clear {
        didSet {
            centerCircleView.backgroundColor = centerCircleBgColor
        }
    }
    
    var centerCircleBorderColor : UIColor = .lightGray {
        didSet {
            centerCircleView.layer.borderColor = centerCircleBorderColor.cgColor
        }
    }
    
    //Value Label
    let valueLabel = UILabel()
    var valueFont : UIFont = .systemFont(ofSize: 28, weight: .heavy) {
        didSet {
            valueLabel.font = valueFont
        }
    }
    var valueColor : UIColor = .black {
        didSet {
            valueLabel.textColor = valueColor
        }
    }
    var value : Int = 0
    var descriptionString: String?
    
    //Description Label
    let descriptionLabel = UILabel()
    var descriptionFont : UIFont = .systemFont(ofSize: 18, weight: .regular) {
        didSet {
            descriptionLabel.font = descriptionFont
        }
    }
    var descriptionColor : UIColor = .black {
        didSet {
            descriptionLabel.textColor = descriptionColor
        }
    }
    
    //Ticks
    var totalAngle : CGFloat = 360
    var rotation : CGFloat = -180
    
    var tickColor = UIColor.clear
    var tickWidth : CGFloat = 7 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    var ticklength : CGFloat = 0
    
    var indicatorTickHeight : CGFloat = 10 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    var indicatorTickScale : CGFloat = 1.5 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    var beforeIndicatorTickOpacity : CGFloat = 1.0 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    var indicatorTickOpacity : CGFloat = 1.0 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    var afterIndicatorTickOpacity : CGFloat = 0.3 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    var segmentWidth : CGFloat = 0.0 
    
    
    var segments : [Segment] = [] {
        didSet {
            self.setNeedsDisplay()
        }
    }

    
    //MARK : Init
    
    override init (frame : CGRect){
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func draw(_ rect: CGRect) {
        guard let ctx = UIGraphicsGetCurrentContext() else {
            return
        }
        drawSegments(in: rect, context: ctx)
    }
    
    //MARK : Setup
    func setup(){
        setupCenterCircle()
        setupValueLabel()
        setupDescriptionLabel()
        setupStackView()
    }
    
    //MARK: Setup Center Circle View
    func setupCenterCircle(){
        let circleHeight = self.frame.height * 0.70
        centerCircleView.backgroundColor = centerCircleBgColor
        centerCircleView.layer.borderWidth = centerCircleBorderWidth
        centerCircleView.layer.borderColor = centerCircleBorderColor.cgColor
        centerCircleView.layer.cornerRadius = circleHeight/2
        centerCircleView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(centerCircleView)
        
        NSLayoutConstraint.activate([
            centerCircleView.heightAnchor.constraint(equalToConstant: circleHeight),
            centerCircleView.widthAnchor.constraint(equalToConstant: circleHeight),
            centerCircleView.centerXAnchor.constraint(equalTo: centerXAnchor),
            centerCircleView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        self.layoutIfNeeded()
    }
    
    //MARK: Setup Value Label
    func setupValueLabel(){
        valueLabel.text = "0%"
        valueLabel.font = valueFont
        valueLabel.textColor = valueColor
        valueLabel.textAlignment = .center
        valueLabel.adjustsFontSizeToFitWidth = true
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK:- Setup Description Label
    func setupDescriptionLabel(){
        descriptionLabel.font = descriptionFont
        descriptionLabel.textColor = descriptionColor
        descriptionLabel.textAlignment = .center
        descriptionLabel.adjustsFontSizeToFitWidth = true
        descriptionLabel.numberOfLines = 2
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK:- Setup Vertical Stack View of Value and Description
    func setupStackView(){
        let vStack = UIStackView(arrangedSubviews: [
            valueLabel,descriptionLabel
        ])
        vStack.spacing = 10
        vStack.axis = .vertical
        vStack.alignment = .center
        vStack.distribution = .equalCentering
        vStack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(vStack)
        
        NSLayoutConstraint.activate([
            vStack.widthAnchor.constraint(equalTo: centerCircleView.widthAnchor, multiplier: 0.8),
            vStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            vStack.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        self.layoutIfNeeded()
    }
    
    //MARK:- Set Value And Description
    func set(value : Int , description : String? = nil){
        let lastValue = self.value
        self.value = validateValue(value: value)
        self.descriptionString = description
        let isPlus = getIsPlus(lastValue: lastValue, value: self.value)
        DispatchQueue.main.async {
            self.counterValue(counter: lastValue, value: self.value , discription: description, isPlus: isPlus)
        }
    }
    
    func counterValue(counter : Int ,value : Int , discription : String? , isPlus : Bool = false){
        var counter = counter
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true){ t in
            if counter == value { t.invalidate() }
            self.setValueAndDescription(value: counter, description: discription)
            counter = isPlus ? counter + 1 : counter - 1
        }
    }
    
    
    func setValueAndDescription(value : Int , description : String?){
        UIView.animate(withDuration: 0.5) {
            self.valueLabel.text = "\(value)%"
            if let description = description {
                self.descriptionLabel.text = "\(description)"
            }
        }
        self.value = value
        self.setNeedsDisplay()
    }
    
    
    //MARK:- Draw Ticks
    func drawSegments(in rect : CGRect, context ctx : CGContext){
        ticklength = self.frame.width * 0.09
        segmentWidth = self.frame.width * 0.08
        ctx.saveGState()
        ctx.translateBy(x: rect.midX, y: rect.midY)
        ctx.rotate(by: degToRad(rotation) - (.pi / 2))
        ctx.saveGState()
        ctx.setLineWidth(tickWidth)
        var realTick = 0
        
        for segment in segments {
            realTick = setSegment(ctx : ctx, rect: rect, segment: segment, realTick: realTick)
        }
        
        ctx.restoreGState()
        ctx.saveGState()
    }
    
    func setSegment(ctx : CGContext, rect : CGRect, segment : Segment, realTick : Int) -> Int{
        
        let totalSegmentAngle = Int(segment.percent*0.6)
        var realTick = realTick
        let percentValue = Int(Double(value)*0.6)
        
        for _ in 0..<totalSegmentAngle {
            setCenterCircleColor(realTick: realTick, value: percentValue , color : segment.color)
            setDescription(realTick: realTick, value: percentValue, description: segment.status)
            drawTicks(ctx : ctx,
                      rect: rect,
                      totalSegmentAngle: totalSegmentAngle,
                      realTick: realTick,
                      segment: segment)
            realTick += 1
        }
        return realTick
    }
    
    func drawTicks(ctx : CGContext,
                   rect : CGRect,
                   totalSegmentAngle : Int,
                   realTick : Int,
                   segment : Segment){
        
        let segmentRadius: CGFloat = (rect.width * 0.85) / 2
        let minorEnd = segmentRadius + (segmentWidth / 2)
        let minorStart = minorEnd - ticklength
        let segmentAngle = degToRad(6)
        
        let percentValue = Int(Double(value)*0.6)
        tickColor = getColor(realTick: realTick, value: percentValue, segmentColor: segment.color)
        
        let tickBuilder = GaugeTickBuilder { (builder) in
            builder.ctx = ctx
            builder.width = getWidthMinor(realTick: realTick, percentValue: percentValue, minorWidth: tickWidth)
            builder.color = tickColor
            builder.start = minorStart
            builder.end = getEndMinor(realTick: realTick, percentValue: percentValue, minorEnd: minorEnd)
            builder.segmentAngle = segmentAngle
        }
        let tick = Tick(builder: tickBuilder)
        tick?.setMinorTick()
    }
    
    func setCenterCircleColor(realTick : Int, value : Int, color : UIColor) {
        if realTick == value {
            self.centerCircleView.layer.borderColor = color.cgColor
        }
    }
    
    func setDescription(realTick : Int, value : Int, description : String){
        if realTick == value {
            self.descriptionLabel.text = description
        }
    }
}

extension MeterGaugeView {
    func validateValue(value : Int)-> Int {
        if value < 0 {
            return 0
        }else if value >= 100{
            return 99
        }else{
            return value
        }
    }
    
    func getIsPlus(lastValue : Int , value : Int)-> Bool{
        return value >= lastValue
    }
    
    func degToRad(_ number : CGFloat)->CGFloat{
        return number * .pi / 180
    }

    func getEndMinor(realTick : Int , percentValue : Int , minorEnd : CGFloat)-> CGFloat{
        if realTick == percentValue {
            return minorEnd + indicatorTickHeight
        }else{
            return minorEnd
        }
    }
    
    func getWidthMinor(realTick : Int , percentValue : Int , minorWidth : CGFloat)-> CGFloat{
        if realTick == percentValue {
            return minorWidth * indicatorTickScale
        }else{
            return minorWidth
        }
    }
    
    
    func getColor(realTick : Int,
                  value : Int,
                  segmentColor : UIColor) -> UIColor{
        
        if realTick < value{
            return segmentColor.withAlphaComponent(beforeIndicatorTickOpacity)
        }
        else if realTick > value{
            return segmentColor.withAlphaComponent(afterIndicatorTickOpacity)
        }
        else{
            return segmentColor.withAlphaComponent(indicatorTickOpacity)
        }
    }
}


final class GaugeTickBuilder {

    var ctx : CGContext?
    var width : CGFloat?
    var color : UIColor?
    var start : CGFloat?
    var end : CGFloat?
    var segmentAngle : CGFloat?

    typealias BuilderClosure = (GaugeTickBuilder) -> ()

    init(buildClosure: BuilderClosure) {
        buildClosure(self)
    }
}

struct Tick {
    var ctx : CGContext
    var width : CGFloat
    var color : UIColor
    var start : CGFloat
    var end : CGFloat
    var segmentAngle : CGFloat

    init?(builder: GaugeTickBuilder) {
        if  let ctx = builder.ctx,
            let width = builder.width,
            let color = builder.color,
            let start = builder.start,
            let end = builder.end,
            let segmentAngle = builder.segmentAngle{
            
            self.ctx = ctx
            self.width = width
            self.color = color
            self.start = start
            self.end = end
            self.segmentAngle = segmentAngle
        }else{
            return nil
        }
    }
    
    func setMinorTick(){
        color.set()
        ctx.setLineWidth(width)
        ctx.move(to: CGPoint(x: start, y: 0))
        ctx.addLine(to: CGPoint(x: end, y: 0))
        ctx.drawPath(using: .stroke)
        ctx.rotate(by: segmentAngle)
    }
}
