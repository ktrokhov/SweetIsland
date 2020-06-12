//
//  HelperFunctions.swift
//  SweetIsland
//
//  Created by Kirill on 12.06.2020.
//  Copyright © 2020 Kirill. All rights reserved.
//

import Foundation


func convertToCurrency(_ number: Double) -> String {
    
    let currencyFormatter = NumberFormatter()
    currencyFormatter.usesGroupingSeparator = true
    currencyFormatter.numberStyle = .currency
    currencyFormatter.locale = Locale.current
    
    return currencyFormatter.string(from: NSNumber(value: number))!
}

