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
    
    override var frame: CGRect {
        didSet {
            updateRoundShape()
        }
    }
    
    private let shape: CAShapeLayer = CAShapeLayer()
    private let selectionShape: CAShapeLayer = CAShapeLayer()
    
    override func awakeFromNib() {
        self.layer.addSublayer(shape)
        
        self.selectedBackgroundView = UIView()
        self.selectedBackgroundView.backgroundColor = UIColor.contentSeperatorsSelectionColor
        self.selectedBackgroundView.layer.mask = selectionShape
        
        self.contentView.layoutMargins.left += Apperance.defaultSpace
        self.contentView.layoutMargins.right += Apperance.defaultSpace
    }
    
}

// MARK: - Round shape

extension RoundedTableViewCell {
    func updateRoundShape() {
        var path: UIBezierPath
        
        var frameSpace = CGRect(x: Apperance.defaultSpace, y: 0, width: self.frame.width - Apperance.defaultSpace * 2, height: self.frame.height)
        path = UIBezierPath(roundedRect: frameSpace, byRoundingCorners: cornersType, cornerRadii: CGSize(width: Apperance.defaultCornerRadius, height: Apperance.defaultCornerRadius))
        
        shape.path = path.CGPath
        shape.fillColor = UIColor.clearColor().CGColor
        shape.strokeColor = UIColor.contentSeperatorsColor.CGColor
        
        selectionShape.path = path.CGPath
        selectionShape.fillColor = UIColor.contentSeperatorsSelectionColor.CGColor
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
}
