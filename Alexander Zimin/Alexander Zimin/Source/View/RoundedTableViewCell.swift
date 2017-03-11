//
//  RoundedTableViewCell.swift
//  Alexander Zimin
//
//  Created by Alex Zimin on 25/04/15.
//  Copyright (c) 2015 Alex Zimin. All rights reserved.
//

import UIKit

enum RoundedType {
    case none, topRounded, bottomRounded, allRounded
}

class RoundedTableViewCell: UITableViewCell {
    
    var roundedType: RoundedType = .none {
        didSet {
            updateRoundShape()
        }
    }
    
    override var frame: CGRect {
        didSet {
            updateRoundShape()
        }
    }
    
    fileprivate let shape: CAShapeLayer = CAShapeLayer()
    fileprivate let selectionShape: CAShapeLayer = CAShapeLayer()
    
    override func awakeFromNib() {
        self.layer.addSublayer(shape)
        
        self.selectedBackgroundView = UIView()
        self.selectedBackgroundView?.backgroundColor = UIColor.contentSeperatorsSelectionColor
        self.selectedBackgroundView?.layer.mask = selectionShape
        
        self.contentView.layoutMargins.left += Apperance.defaultSpace
        self.contentView.layoutMargins.right += Apperance.defaultSpace
    }
    
}

// MARK: - Round shape

extension RoundedTableViewCell {
    func updateRoundShape() {
        var path: UIBezierPath
        
        let frameSpace = CGRect(x: Apperance.defaultSpace, y: 0, width: self.frame.width - Apperance.defaultSpace * 2, height: self.frame.height)
        path = UIBezierPath(roundedRect: frameSpace, byRoundingCorners: cornersType, cornerRadii: CGSize(width: Apperance.defaultCornerRadius, height: Apperance.defaultCornerRadius))
        
        shape.path = path.cgPath
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeColor = UIColor.contentSeperatorsColor.cgColor
        
        selectionShape.path = path.cgPath
        selectionShape.fillColor = UIColor.contentSeperatorsSelectionColor.cgColor
    }
    
    fileprivate var cornersType: UIRectCorner {
        switch roundedType {
        case .topRounded:
            return [.topLeft, .topRight]
        case .bottomRounded:
            return [.bottomLeft, .bottomRight]
        case .allRounded:
            return .allCorners
        default:
            return []
        }
    }
}
