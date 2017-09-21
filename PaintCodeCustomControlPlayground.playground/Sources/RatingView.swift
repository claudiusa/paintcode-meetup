import UIKit

@IBDesignable
public class RatingView : UIView {
    
    public var color:UIColor = UIColor(red: 0.000, green: 0.063, blue: 1.000, alpha: 1.000) {
        didSet{
            setNeedsDisplay()
        }
    }
    
    public var label:String = "😀😀😀😀😀" {
        didSet{
            setNeedsDisplay()
        }
    }
    
    public var ratingValue:CGFloat = 0 {
        didSet{
            setNeedsDisplay()
        }
    }
    
    public var radius:Int = 0 {
        didSet{
            setNeedsDisplay()
        }
    }
    
    public var border:Int = 0 {
        didSet{
            setNeedsDisplay()
        }
    }
    
    override public func draw(_ rect: CGRect) {
        StyleKitControls.drawRatingControl(frame: rect, color: color, value: CGFloat(ratingValue), label: label, radius: CGFloat(radius), border: CGFloat(border), total: CGFloat(label.characters.count))
    }
    
}
