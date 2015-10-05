//
//  ColorUtil.swift
//  SupportMate
//
//  Created by Anindya Sengupta on 6/5/15.
//  Copyright (c) 2015 Anindya Sengupta. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    class func Good() -> UIColor {
        return UIColor(red: 175/255, green: 203/255, blue: 183/255, alpha: 1.0)
    }
    
    class func Warning()->UIColor {
        return UIColor(red: 254/255, green: 197/255, blue: 137/255, alpha: 1.0)
    }
    
    class func Alarm()-> UIColor{
        return UIColor(red: 225/255, green: 109/255, blue: 116/255, alpha: 1.0)
    }
}

