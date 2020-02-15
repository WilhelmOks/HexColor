/**
*  HexColor
*  Copyright (c) Wilhelm Oks 2020
*  Licensed under the MIT license (see LICENSE file)
*/

#if !os(macOS)

import UIKit
import HexColor

public extension UIColor {
    static func fromHexString(hex: String, alpha: CGFloat? = nil) -> UIColor? {
        guard let integer = HexColor.intFromHexString(hex: hex) else { return nil }
        let components = HexColor.rgbaFromInt(integer: integer)
        
        if let alpha = alpha {
            return UIColor(
                red:   components.r,
                green: components.g,
                blue:  components.b,
                alpha: alpha)
        } else {
            return UIColor(
                red:   components.r,
                green: components.g,
                blue:  components.b,
                alpha: components.a)
        }
    }
}

#endif
