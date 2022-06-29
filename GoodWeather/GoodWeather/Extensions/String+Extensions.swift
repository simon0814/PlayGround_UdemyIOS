//
//  String+Extensions.swift
//  GoodWeather
//
//  Created by simon li on 26/5/2022.
//  Copyright © 2022 Mohammad Azam. All rights reserved.
//

import Foundation

extension String {
    
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
    
}
