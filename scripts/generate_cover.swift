import AppKit

let width = 1280
let height = 640
let outputPath = "/Users/user/pcb-business-card-blinker/assets/cover-image.png"

func rgba(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat = 1.0) -> NSColor {
    NSColor(calibratedRed: r / 255, green: g / 255, blue: b / 255, alpha: a)
}

func drawRoundedRect(_ rect: NSRect, radius: CGFloat, color: NSColor) {
    color.setFill()
    NSBezierPath(roundedRect: rect, xRadius: radius, yRadius: radius).fill()
}

func drawCircle(center: CGPoint, radius: CGFloat, color: NSColor) {
    color.setFill()
    NSBezierPath(ovalIn: NSRect(x: center.x - radius, y: center.y - radius, width: radius * 2, height: radius * 2)).fill()
}

func drawLine(from: CGPoint, to: CGPoint, width: CGFloat, color: NSColor) {
    color.setStroke()
    let path = NSBezierPath()
    path.lineWidth = width
    path.lineCapStyle = .round
    path.move(to: from)
    path.line(to: to)
    path.stroke()
}

func drawText(_ text: String, rect: NSRect, size: CGFloat, weight: NSFont.Weight, color: NSColor) {
    let font = NSFont.systemFont(ofSize: size, weight: weight)
    let paragraph = NSMutableParagraphStyle()
    paragraph.lineBreakMode = .byWordWrapping
    let attrs: [NSAttributedString.Key: Any] = [
        .font: font,
        .foregroundColor: color,
        .paragraphStyle: paragraph
    ]
    (text as NSString).draw(with: rect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: attrs)
}

let image = NSImage(size: NSSize(width: width, height: height))
image.lockFocus()

// Background
drawRoundedRect(NSRect(x: 0, y: 0, width: width, height: height), radius: 28, color: rgba(15, 23, 42))
drawCircle(center: CGPoint(x: 180, y: 90), radius: 220, color: rgba(250, 204, 21, 0.06))
drawCircle(center: CGPoint(x: 1130, y: 540), radius: 170, color: rgba(45, 212, 191, 0.08))

// Text block
drawText("PCB Business Card Blinker", rect: NSRect(x: 86, y: 380, width: 700, height: 120), size: 70, weight: .bold, color: rgba(226, 232, 240))
drawText("Beginner-friendly electronics starter project", rect: NSRect(x: 90, y: 310, width: 760, height: 50), size: 26, weight: .semibold, color: rgba(147, 197, 253))
drawText("Simple LED circuit  •  Coin cell powered  •  $0-$50 build", rect: NSRect(x: 90, y: 250, width: 780, height: 50), size: 22, weight: .regular, color: rgba(203, 213, 225))

// Badge
drawRoundedRect(NSRect(x: 90, y: 170, width: 190, height: 54), radius: 27, color: rgba(34, 197, 94, 0.16))
NSColor(rgba(34, 197, 94, 0.6)).setStroke()
let badgeBorder = NSBezierPath(roundedRect: NSRect(x: 90, y: 170, width: 190, height: 54), xRadius: 27, yRadius: 27)
badgeBorder.lineWidth = 2
badgeBorder.stroke()
drawText("Tier 4 Starter", rect: NSRect(x: 118, y: 184, width: 150, height: 28), size: 22, weight: .bold, color: rgba(220, 252, 231))

// Status dots
drawCircle(center: CGPoint(x: 104, y: 110), radius: 12, color: rgba(250, 204, 21))
drawCircle(center: CGPoint(x: 140, y: 110), radius: 12, color: rgba(34, 197, 94))
drawCircle(center: CGPoint(x: 176, y: 110), radius: 12, color: rgba(56, 189, 248))

// Stylized PCB card
let transform = AffineTransform(rotationByDegrees: -8)
let cardRect = NSRect(x: 835, y: 165, width: 360, height: 220)
let cardPath = NSBezierPath(roundedRect: cardRect, xRadius: 24, yRadius: 24)
var cardTransform = AffineTransform()
cardTransform.translate(x: 1015, y: 275)
cardTransform.rotate(byDegrees: -8)
cardTransform.translate(x: -1015, y: -275)
cardPath.transform(using: cardTransform)
rgba(248, 250, 252).setFill()
cardPath.fill()

// Card content
drawLine(from: CGPoint(x: 885, y: 270), to: CGPoint(x: 1090, y: 270), width: 8, color: rgba(34, 197, 94))
drawLine(from: CGPoint(x: 915, y: 235), to: CGPoint(x: 1120, y: 255), width: 8, color: rgba(250, 204, 21))
drawLine(from: CGPoint(x: 900, y: 205), to: CGPoint(x: 1110, y: 215), width: 8, color: rgba(56, 189, 248))
drawCircle(center: CGPoint(x: 1090, y: 316), radius: 12, color: rgba(250, 204, 21))
drawCircle(center: CGPoint(x: 1125, y: 312), radius: 12, color: rgba(34, 197, 94))
drawCircle(center: CGPoint(x: 1160, y: 308), radius: 12, color: rgba(56, 189, 248))
drawRoundedRect(NSRect(x: 880, y: 312, width: 150, height: 14), radius: 7, color: rgba(15, 23, 42))
drawRoundedRect(NSRect(x: 880, y: 286, width: 110, height: 9), radius: 4.5, color: rgba(100, 116, 139))
drawRoundedRect(NSRect(x: 880, y: 266, width: 130, height: 9), radius: 4.5, color: rgba(148, 163, 184))
drawRoundedRect(NSRect(x: 870, y: 195, width: 24, height: 24), radius: 5, color: rgba(15, 23, 42))
drawRoundedRect(NSRect(x: 876, y: 201, width: 12, height: 12), radius: 2, color: rgba(226, 232, 240))

image.unlockFocus()

guard
    let tiffData = image.tiffRepresentation,
    let bitmap = NSBitmapImageRep(data: tiffData),
    let pngData = bitmap.representation(using: .png, properties: [:])
else {
    fatalError("Failed to create PNG data")
}

try pngData.write(to: URL(fileURLWithPath: outputPath))
print(outputPath)
