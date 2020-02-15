#if os(macOS)

import AppKit
import HexColor

public extension NSColor {
    static func fromHexString(hex: String, alpha: CGFloat? = nil) -> NSColor? {
        guard let integer = HexColor.intFromHexString(hex: hex) else { return nil }
        let components = HexColor.rgbaFromInt(integer: integer)
        
        if let alpha = alpha {
            return NSColor(
                red:   components.r,
                green: components.g,
                blue:  components.b,
                alpha: alpha)
        } else {
            return NSColor(
                red:   components.r,
                green: components.g,
                blue:  components.b,
                alpha: components.a)
        }
    }
}

#endif
