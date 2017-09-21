//
//  StyleKitControls.swift
//  ProjectControls
//
//  Created by Claudius on 30.08.17.
//  Copyright © 2017 Claudius Albat. All rights reserved.
//
//  Generated by PaintCode
//  http://www.paintcodeapp.com
//



import UIKit

public class StyleKitControls : NSObject {

    //// Drawing Methods

    @objc dynamic public class func drawRatingControl(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 250, height: 50), resizing: ResizingBehavior = .aspectFit, color: UIColor = UIColor(red: 0.000, green: 0.063, blue: 1.000, alpha: 1.000), value: CGFloat = 3, label: String = "😱😨😐🙂😃", radius: CGFloat = 10, border: CGFloat = 3, total: CGFloat = 5) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 250, height: 50), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 250, y: resizedFrame.height / 50)


        //// Color Declarations
        var colorRedComponent: CGFloat = 1
        var colorGreenComponent: CGFloat = 1
        var colorBlueComponent: CGFloat = 1
        color.getRed(&colorRedComponent, green: &colorGreenComponent, blue: &colorBlueComponent, alpha: nil)

        let colorShadow = UIColor(red: (colorRedComponent * 0.5), green: (colorGreenComponent * 0.5), blue: (colorBlueComponent * 0.5), alpha: (color.cgColor.alpha * 0.5 + 0.5))
        let colorHighlight = UIColor(red: (colorRedComponent * 0.25 + 0.75), green: (colorGreenComponent * 0.25 + 0.75), blue: (colorBlueComponent * 0.25 + 0.75), alpha: (color.cgColor.alpha * 0.25 + 0.75))

        //// Gradient Declarations
        let fillGradient = CGGradient(colorsSpace: nil, colors: [colorShadow.cgColor, colorHighlight.cgColor] as CFArray, locations: [0, 1])!
        let borderGradient = CGGradient(colorsSpace: nil, colors: [colorHighlight.cgColor, colorShadow.cgColor] as CFArray, locations: [0, 1])!

        //// Variable Declarations
        let _maskWidth: CGFloat = value * 40
        let _borderRadius: CGFloat = radius - border
        let _borderRect = CGRect(x: border, y: border, width: 250 - 2 * border, height: 50 - 2 * border)
        let _ratingOffset: CGFloat = 125 + total * -20

        //// RatingBG 2 Drawing
        let ratingBG2Path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 250, height: 50), cornerRadius: radius)
        context.saveGState()
        ratingBG2Path.addClip()
        context.drawLinearGradient(borderGradient, start: CGPoint(x: 125, y: -0), end: CGPoint(x: 125, y: 50), options: [])
        context.restoreGState()


        //// RatingBG Drawing
        let ratingBGRect = CGRect(x: _borderRect.minX, y: (_borderRect.minY - 1), width: _borderRect.width, height: _borderRect.height)
        let ratingBGPath = UIBezierPath(roundedRect: ratingBGRect, cornerRadius: _borderRadius)
        context.saveGState()
        ratingBGPath.addClip()
        context.drawLinearGradient(fillGradient,
            start: CGPoint(x: ratingBGRect.midX, y: ratingBGRect.minY),
            end: CGPoint(x: ratingBGRect.midX, y: ratingBGRect.maxY),
            options: [])
        context.restoreGState()


        //// RatingLabelGroup
        context.saveGState()
        context.setAlpha(0.5)
        context.setBlendMode(.luminosity)
        context.beginTransparencyLayer(auxiliaryInfo: nil)


        //// RatingLabelInactive Drawing
        let ratingLabelInactiveRect = CGRect(x: 0, y: 0, width: 250, height: 50)
        let ratingLabelInactiveStyle = NSMutableParagraphStyle()
        ratingLabelInactiveStyle.alignment = .center
        let ratingLabelInactiveFontAttributes = [
            .font: UIFont(name: "AppleColorEmoji", size: 40)!,
            .foregroundColor: UIColor.white,
            .paragraphStyle: ratingLabelInactiveStyle,
        ] as [NSAttributedStringKey: Any]

        let ratingLabelInactiveTextHeight: CGFloat = label.boundingRect(with: CGSize(width: ratingLabelInactiveRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: ratingLabelInactiveFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: ratingLabelInactiveRect)
        label.draw(in: CGRect(x: ratingLabelInactiveRect.minX, y: ratingLabelInactiveRect.minY + (ratingLabelInactiveRect.height - ratingLabelInactiveTextHeight) / 2, width: ratingLabelInactiveRect.width, height: ratingLabelInactiveTextHeight), withAttributes: ratingLabelInactiveFontAttributes)
        context.restoreGState()


        context.endTransparencyLayer()
        context.restoreGState()


        //// RatingLabel
        context.saveGState()
        context.beginTransparencyLayer(auxiliaryInfo: nil)

        //// Clip RatingLabelActiveMask
        let ratingLabelActiveMaskPath = UIBezierPath(rect: CGRect(x: _ratingOffset, y: 0, width: _maskWidth, height: 50))
        var ratingLabelActiveMaskTransformation = CGAffineTransform.identity
        ratingLabelActiveMaskPath.apply(ratingLabelActiveMaskTransformation)
        ratingLabelActiveMaskPath.addClip()


        //// RatingLabelActive Drawing
        let ratingLabelActiveRect = CGRect(x: 0, y: 0, width: 250, height: 50)
        let ratingLabelActiveStyle = NSMutableParagraphStyle()
        ratingLabelActiveStyle.alignment = .center
        let ratingLabelActiveFontAttributes = [
            .font: UIFont(name: "AppleColorEmoji", size: 40)!,
            .foregroundColor: UIColor.white,
            .paragraphStyle: ratingLabelActiveStyle,
        ] as [NSAttributedStringKey: Any]

        let ratingLabelActiveTextHeight: CGFloat = label.boundingRect(with: CGSize(width: ratingLabelActiveRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: ratingLabelActiveFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: ratingLabelActiveRect)
        label.draw(in: CGRect(x: ratingLabelActiveRect.minX, y: ratingLabelActiveRect.minY + (ratingLabelActiveRect.height - ratingLabelActiveTextHeight) / 2, width: ratingLabelActiveRect.width, height: ratingLabelActiveTextHeight), withAttributes: ratingLabelActiveFontAttributes)
        context.restoreGState()


        context.endTransparencyLayer()
        context.restoreGState()
        
        context.restoreGState()

    }




    @objc(StyleKitControlsResizingBehavior)
    public enum ResizingBehavior: Int {
        case aspectFit /// The content is proportionally resized to fit into the target rectangle.
        case aspectFill /// The content is proportionally resized to completely fill the target rectangle.
        case stretch /// The content is stretched to match the entire target rectangle.
        case center /// The content is centered in the target rectangle, but it is NOT resized.

        public func apply(rect: CGRect, target: CGRect) -> CGRect {
            if rect == target || target == CGRect.zero {
                return rect
            }

            var scales = CGSize.zero
            scales.width = abs(target.width / rect.width)
            scales.height = abs(target.height / rect.height)

            switch self {
                case .aspectFit:
                    scales.width = min(scales.width, scales.height)
                    scales.height = scales.width
                case .aspectFill:
                    scales.width = max(scales.width, scales.height)
                    scales.height = scales.width
                case .stretch:
                    break
                case .center:
                    scales.width = 1
                    scales.height = 1
            }

            var result = rect.standardized
            result.size.width *= scales.width
            result.size.height *= scales.height
            result.origin.x = target.minX + (target.width - result.width) / 2
            result.origin.y = target.minY + (target.height - result.height) / 2
            return result
        }
    }
}
