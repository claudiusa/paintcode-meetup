import UIKit

@IBDesignable
public class RatingControl: UIControl {
    
    var previousLocation = CGPoint()
    
    public var ratingValue:CGFloat = 0 {
        didSet{
            setNeedsDisplay()
        }
    }
    
    public var label:String = "⚽️⚽️⚽️⚽️⚽️" {
        didSet{
            setNeedsDisplay()
        }
    }
    
    override public func draw(_ rect: CGRect) {
        removeAllSubViews()
        
        let ratingView:RatingView = RatingView(frame: rect)
        ratingView.ratingValue = ratingValue
        ratingView.radius = 10
        ratingView.border = 3
        ratingView.label = label
        ratingView.color = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        ratingView.isUserInteractionEnabled = false
        
        self.addSubview(ratingView)
    }
    
    func removeAllSubViews() {
        for subView :AnyObject in subviews {
            subView.removeFromSuperview()
        }
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            previousLocation = touch.location(in: self)
        }
        // Hit test the frame layers
        if frame.contains(previousLocation) {
            self.isHighlighted = true
        }
        
        super.touchesBegan(touches , with:event)
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if self.isHighlighted {
            if let touch = touches.first {
                
                let location = touch.location(in: self)
            
                let deltaLocation = location.x - previousLocation.x
                let maxValue:CGFloat = 5.0
            
                let deltaValue = maxValue * deltaLocation / bounds.width
            
                previousLocation = location
            
                let currentValue:CGFloat = ratingValue + deltaValue
            
            
                ratingValue = max(0, min(currentValue, maxValue))
            }
        }
        
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.isHighlighted = false
        setNeedsDisplay()
    }
    
    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.isHighlighted = false
        setNeedsDisplay()
    }
    
 
}
