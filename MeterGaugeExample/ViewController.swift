//
//  ViewController.swift
//  MeterGaugeExample
//
//  Created by Amir on 2/4/21.
//

import UIKit
import MeterGauge

class ViewController: UIViewController {
    
    @IBOutlet weak var gaugeView: MeterGauge!
    
    @IBOutlet weak var valuePercentTextField: UITextField!
    @IBOutlet weak var valueApplyBtn: UIButton!
    @IBOutlet weak var segmentPercentTextField: UITextField!
    @IBOutlet weak var segmentColorRedTextField: UITextField!
    @IBOutlet weak var segmentColorGreenTextField: UITextField!
    @IBOutlet weak var segmentColorBlueTextField: UITextField!
    @IBOutlet weak var segmentStatusTextField: UITextField!
    
    @IBOutlet weak var addSegmentBtn: UIButton!
    
    @IBOutlet weak var removeSegmentBtn: UIButton!
    
    var segments : [Segment] = []
    
    var indicatorTickHeight : CGFloat = 10
    var indicatorTickScale : CGFloat = 1.5
    var indicatorTickOpacity : CGFloat = 1.0
    
    var beforeIndicatorTickOpacity : CGFloat = 1.0
    var afterIndicatorTickOpacity : CGFloat = 0.3
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup(){
        setupUI()
        setupBackgroundTapped()
    }
    
    func setupUI(){
        valueApplyBtn.layer.cornerRadius = 8
        removeSegmentBtn.layer.cornerRadius = 8
        addSegmentBtn.layer.cornerRadius = 8
    }
    
    func setupBackgroundTapped(){
        let tapOnBackView = UITapGestureRecognizer(target: self,action: #selector(self.backViewTapped(_:)))
        self.view.addGestureRecognizer(tapOnBackView)
    }
    
    @objc func backViewTapped(_ sender: UITapGestureRecognizer) {
        self.segmentPercentTextField.endEditing(true)
        self.segmentColorRedTextField.endEditing(true)
        self.segmentColorGreenTextField.endEditing(true)
        self.segmentColorBlueTextField.endEditing(true)
        self.segmentStatusTextField.endEditing(true)
        self.valuePercentTextField.endEditing(true)
    }
    
    @IBAction func valueApplyBtnPressed(_ sender: Any) {
        guard let value = valuePercentTextField.text else {return}
        let intValue = Int(value) ?? 0
        gaugeView.set(value: intValue)
        clearValueTextField()
    }
    
    
    @IBAction func valueFontSizeChanged(_ sender: UISlider) {
        let size : CGFloat = CGFloat(sender.value)
        let font : UIFont = .systemFont(ofSize: size, weight: .heavy)
        gaugeView.valueFont = font
    }
    
    @IBAction func descriptionFontSizeChaned(_ sender: UISlider) {
        let size : CGFloat = CGFloat(sender.value)
        let font : UIFont = .systemFont(ofSize: size, weight: .regular)
        gaugeView.descriptionFont = font
    }
    
    @IBAction func tickWidthChanged(_ sender: UISlider) {
        let value : CGFloat = CGFloat(sender.value)
        gaugeView.tickWidth = value
    }
    
    @IBAction func indicatorTickHeightChanged(_ sender: UISlider) {
        indicatorTickHeight = CGFloat(sender.value)
        gaugeView.indicatorTickHeight = indicatorTickHeight
    }
    
    @IBAction func indicatorTickScaleChanged(_ sender: UISlider) {
        indicatorTickScale = CGFloat(sender.value)
        gaugeView.indicatorTickScale = indicatorTickScale
    }
    
    @IBAction func beforeIndicatorOpacityChanged(_ sender: UISlider) {
        beforeIndicatorTickOpacity = CGFloat(sender.value)
        gaugeView.beforeIndicatorTickOpacity = beforeIndicatorTickOpacity
    }
    
    @IBAction func indicatorTickOpacityChanged(_ sender: UISlider) {
        indicatorTickOpacity = CGFloat(sender.value)
        gaugeView.indicatorTickOpacity = indicatorTickOpacity
    }
    
    @IBAction func afterIndicatorTickOpacityChanged(_ sender: UISlider) {
        afterIndicatorTickOpacity = CGFloat(sender.value)
        gaugeView.afterIndicatorTickOpacity = afterIndicatorTickOpacity
    }
    
    @IBAction func addSegmentBtnPressed(_ sender: UISlider) {
        guard let percent = segmentPercentTextField.text else { return }
        guard let red = segmentColorRedTextField.text else { return }
        guard let blue = segmentColorBlueTextField.text else { return }
        guard let green = segmentColorGreenTextField.text else { return }
        guard let status = segmentStatusTextField.text else { return }
        
        let color = UIColor(red: Int(red) ?? 0, green: Int(green) ?? 0, blue: Int(blue) ?? 0)
        
        let segment = Segment(percent: Float(percent) ?? 0, color: color, status: status)
        segments.append(segment)
        gaugeView.segments = segments
        clearSegmentTextField()
    }
    
    @IBAction func removedSegmentBtnPressed(_ sender: UISlider) {
        if segments.count == 0 {return}
        segments.removeLast()
        gaugeView.segments = segments
    }
    
    
    func clearSegmentTextField(){
        self.segmentPercentTextField.text = nil
        self.segmentColorRedTextField.text = nil
        self.segmentColorGreenTextField.text = nil
        self.segmentColorBlueTextField.text = nil
        self.segmentStatusTextField.text = nil
    }
    
    func clearValueTextField(){
        self.valuePercentTextField.text = nil
    }
}

