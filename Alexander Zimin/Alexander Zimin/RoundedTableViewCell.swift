//
//  RoundedTableViewCell.swift
//  Alexander Zimin
//
//  Created by Alex Zimin on 25/04/15.
//  Copyright (c) 2015 Alex Zimin. All rights reserved.
//

import UIKit

enum RoundedType {
    case None, TopRounded, BottomRounded, AllRounded
}

class RoundedTableViewCell: UITableViewCell {
    
    var roundedType: RoundedType = .None {
        didSet {
            updateRoundShape()
        }
    }
    
    let shape: CAShapeLayer = CAShapeLayer()
    
    override func awakeFromNib() {
        self.layer.addSublayer(shape)
    }
    
    override var frame: CGRect {
        didSet {
            updateRoundShape()
        }
    }
    
    func updateRoundShape() {
        var path: UIBezierPath
        
        path = UIBezierPath(roundedRect: cornersFrame, byRoundingCorners: cornersType, cornerRadii: CGSize(width: Apperance.defaultCornerRadius, height: Apperance.defaultCornerRadius))
        
        shape.path = path.CGPath
        shape.fillColor = UIColor.clearColor().CGColor
        shape.strokeColor = UIColor.contentSeperatorsColor.CGColor
    }
    
    private var cornersFrame: CGRect {
        let space = Apperance.defaultSpace
        var frame = CGRect(x: Apperance.defaultSpace, y: 0, width: self.frame.width - Apperance.defaultSpace * 2, height: self.frame.height)
        
        if roundedType == .TopRounded || roundedType == .AllRounded {
            frame.origin.y += space
            frame.size.height -= space
        }
        
        if roundedType == .BottomRounded || roundedType == .AllRounded {
            frame.size.height -= space
        }
        
        return frame
    }
    
    private var cornersType: UIRectCorner {
        switch roundedType {
        case .TopRounded:
            return .TopLeft | .TopRight
        case .BottomRounded:
            return .BottomLeft | .BottomRight
        case .AllRounded:
            return .AllCorners
        default:
            return .allZeros
        }
    }
    
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        if highlighted {
            shape.fillColor = UIColor.contentSeperatorsColor.CGColor
        } else {
            shape.fillColor = UIColor.clearColor().CGColor
        }
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        if selected {
            shape.fillColor = UIColor.contentSeperatorsColor.CGColor
        } else {
            shape.fillColor = UIColor.clearColor().CGColor
        }
    }
    
}
