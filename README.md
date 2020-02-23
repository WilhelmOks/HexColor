<p>
    <img src="https://img.shields.io/badge/Swift-5-orange.svg" />
    <a href="https://swift.org/package-manager">
        <img src="https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat" alt="Swift Package Manager" />
    </a>
    <img src="https://img.shields.io/badge/platforms-macOS iOS tvOS watchOS-brightgreen.svg?style=flat" alt="Mac" />
</p>

# #️⃣ HexColor

HexColor is a small library that converts colors from hex notation (e.g. #eb5e34) to the commonly used standard color objects NSColor (for macOS) or UIColor (for iOS, tvOS and watchOS).

## Usage

Call the static function `fromHexString` on `NSColor` and pass a string containing a hex color value:
```swift
let color = NSColor.fromHexString("#eb5e34") ?? .white
```
The function returns an `NSColor` object.

Invalid hex color codes will result in `nil`. You can use the `??` syntax to default to another color in that case.

The `#` character in the hex string is optional and can be omitted:
```swift
let color = NSColor.fromHexString("eb5e34")
```

The shorthand 3 digit notation can be used, too:
```swift
let color = NSColor.fromHexString("e53") // same hex color code as "ee5533"
```

The alpha channel is taken from the hex string, if available:
```swift
let color = NSColor.fromHexString("eb5e34cc") // the "cc" will convert to the alpha value 0.8
```
If not available, it is assumed to be "ff" and the alpha value will be 1.

The alpha value can be set explicitly. In this case, the alpha part from the hex string is ignored:
```swift
let color = NSColor.fromHexString("eb5e34cc", alpha: 0.5) // ignores "cc" and uses alpha value 0.5
```

You can convert to `UIColor` with the same code that is provided for `NSColor`:

```swift
let color = UIColor.fromHexString("#eb5e34") ?? .white
```

If you need the colors to be converted to more general structures, you can use the functions defined in the `HexColor` struct (needs `import HexColor`):

```swift
let integer = HexColor.intFromHexString("#eb5e34") //returns the integer value 0xeb5e34ff
```

```swift
let (r, g, b, a) = HexColor.rgbaFromInt(0xeb5e34ff) //returns a tuple containing the (red, green, blue, alpha) CGFloat color components 
```

## Installation

### Swift Package Manager

This library is a Swift Module and can be used as a dependency in the `Package.swift` file:

```
.package(url: "https://github.com/WilhelmOks/HexColor.git", from: "1.0.1")
```

`import HexNSColor` on macOS or `import HexUIColor` on iOS/tvOS/watchOS.

### Copy Source Files

Alternatively, you can simply copy the source files into your project.

You need the file `Sources/HexColor/HexColor.swift`.

And additionally `Sources/HexNSColor/NSColorExtensions.swift` for macOS or `Sources/HexUIColor/UIColorExtensions.swift` for iOS/tvOS/watchOS.
