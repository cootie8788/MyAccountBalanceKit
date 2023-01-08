//
//  Extension_String.swift
//  MyAccountBalancekit
//
//  Created by Henry Lin on 2023/1/7.
//

import Foundation

extension String {

    var thousandths:String{
        let doubleValue = NSDecimalNumber(string: self).doubleValue
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.roundingMode = .down
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: doubleValue)) ?? ""
    }

}
