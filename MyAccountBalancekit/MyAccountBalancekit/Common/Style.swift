//
//  Style.swift
//  MyAccountBalancekit
//
//  Created by Henry Lin on 2023/1/5.
//

import UIKit

struct Style{
    
    struct RoundCorner{
        static func setRoundCorner(view:UIView, radius:CGFloat, color:CGColor){
            view.layer.borderColor = color
            view.clipsToBounds = true
            view.layer.cornerRadius = radius
        }
    }
    
    struct Shadow{
        static let maskToBounds = false
        static let color:CGColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        static let opacity:Float = 0.2
        static let radius:CGFloat = 3
        static let offset:CGSize = CGSize(width: 4, height: 4)
        
        static func setDefaultShadow(view:UIView, cornerRadius:CGFloat){
            view.layer.masksToBounds = maskToBounds
            view.layer.shadowColor = color
            view.layer.shadowRadius = radius
            view.layer.shadowOffset = offset
            view.layer.shadowOpacity = opacity
            view.layer.cornerRadius = cornerRadius
        }
    }
}
