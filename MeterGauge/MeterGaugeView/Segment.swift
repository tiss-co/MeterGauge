//
//  SegmentModel.swift
//  MeterGauge
//
//  Created by Amir on 2/4/21.
//

import Foundation
import UIKit

public struct Segment {
    let percent : Float
    let color : UIColor
    let status : String
    
    public init(percent : Float, color : UIColor, status : String){
        self.percent = percent
        self.color = color
        self.status = status
    }
}
