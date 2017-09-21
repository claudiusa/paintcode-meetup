//
//  CombinationLockControl.swift
//  CombinationLock
//
//  Created by Claudius Albat on 29.08.17.
//  Copyright © 2017 Claudius Albat. All rights reserved.
//

import UIKit

@IBDesignable
public class CombinationLockControl: UIControl {
    
    var previousLocation = CGPoint()
    
    var startRotation:CGFloat = 0.0
    var lastRotation:CGFloat = 0.0
    var currentRotation:CGFloat = 0.0
    
    public var lockValue:CGFloat = 0 {
        didSet{
            setNeedsDisplay()
        }
    }
    
    override public func draw(_ rect: CGRect) {
        removeAllSubViews()
        
        let combinationLockView:CombinationLockView = CombinationLockView(frame: rect)
        combinationLockView.lockValue = lockValue
        combinationLockView.backgroundColor = UIColor.lightGray
        combinationLockView.isUserInteractionEnabled = false
        
        self.addSubview(combinationLockView)
    }
    
    func removeAllSubViews() {
        for subView :AnyObject in subviews {
            subView.removeFromSuperview()
        }
    }
    
    func updateRotationWithTouches(touches: Set<UITouch>) {
        if let touch = touches.first {
            currentRotation = rotationForLocation(location:touch.location(in: self))
            currentRotation = currentRotation + CGFloat.pi/2
            currentRotation = normalize(num: currentRotation)
        }
    }
    
    func rotationForLocation(location: CGPoint) -> CGFloat {
        let offset = CGPoint(x: location.x - frame.width/2, y: location.y - frame.height/2)
        return atan2(offset.y, offset.x)
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches , with:event)
        updateRotationWithTouches(touches:touches)
        startRotation = lastRotation + currentRotation
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with:event)
        updateRotationWithTouches(touches:touches)
        lastRotation = startRotation-currentRotation
        lockValue = CGFloat(radiansToDegrees(radians: Double(lastRotation)))/3.6
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with:event)
        snapValue()
    }
    
    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with:event)
        snapValue()
    }
    
    func snapValue() {
        lockValue = (lockValue.rounded()+100).truncatingRemainder(dividingBy: 100)
        print("ratingControl snap to \(lockValue)")
    }
    
    func normalize(num:CGFloat) -> CGFloat {
        return (num + 2 * CGFloat.pi).truncatingRemainder(dividingBy: 2 * CGFloat.pi)
    }
    
    func radiansToDegrees (radians: Double)->Double {
        return radians * 180 / Double.pi
    }
    
}

