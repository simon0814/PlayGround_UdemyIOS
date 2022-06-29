//
//  Double+Extensions.swift
//  GoodWeather
//
//  Created by simon li on 27/5/2022.
//  Copyright © 2022 Mohammad Azam. All rights reserved.
//

import Foundation

extension Double {
    
    func formatAsDegree() -> String {
        return String(format: "%.0f", self)
    }
    
}
