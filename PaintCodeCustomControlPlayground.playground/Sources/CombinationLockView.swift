//
//  CombinationLockView.swift
//  CombinationLock
//
//  Created by Claudius Albat on 29.08.17.
//  Copyright © 2017 Claudius Albat. All rights reserved.
//

import UIKit

@IBDesignable
public class CombinationLockView : UIView {
    
    public var lockValue:CGFloat = 0 {
        didSet{
            setNeedsDisplay()
        }
    }
    
    override public func draw(_ rect: CGRect) {
        print("CombinationLockView draw")
        CombinationLockStyleKit.drawCombinationLock(frame: rect, resizing: CombinationLockStyleKit.ResizingBehavior.aspectFit, value: lockValue)
    }
    
}
