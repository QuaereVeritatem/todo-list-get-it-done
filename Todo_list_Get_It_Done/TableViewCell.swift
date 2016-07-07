//
//  TableViewCell.swift
//  Todo_list_Get_It_Done
//
//  Created by Robert Martin on 7/6/16.
//  Copyright © 2016 Robert Martin. All rights reserved.
//

//this class will make it so that each cell has a gradient on it as well

import UIKit
import QuartzCore

class TableViewCell: UITableViewCell {
    
    let gradientLayer = CAGradientLayer()
    //two properties function handlepan will use
    var originalCenter = CGPoint()
    var deleteOnDragRelease = false
    
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // gradient layer for cell
        gradientLayer.frame = bounds
        let color1 = UIColor(white: 1.0, alpha: 0.2).CGColor as CGColorRef
        let color2 = UIColor(white: 1.0, alpha: 0.1).CGColor as CGColorRef
        let color3 = UIColor.clearColor().CGColor as CGColorRef
        let color4 = UIColor(white: 0.0, alpha: 0.1).CGColor as CGColorRef
        gradientLayer.colors = [color1, color2, color3, color4]
        gradientLayer.locations = [0.0, 0.01, 0.95, 1.0]
        layer.insertSublayer(gradientLayer, atIndex: 0)
        
        // add a pan recognizer
        var recognizer = UIPanGestureRecognizer(target: self, action: "handlePan:")
        recognizer.delegate = self
        addGestureRecognizer(recognizer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    //MARK: - horizontal pan gesture methods 
/* Gesture handlers, such as this method, are invoked at various points within the gesture lifecycle: the start, change (i.e., when a gesture is in progress), and end. When the pan first starts, the center location of the cell is recorded in originalCenter.
 As the pan gesture progresses (as the user moves their finger), the method determines the offset that should be applied to the cell (to show the cell being dragged) by getting the new location based on the gesture, and offsetting the center property accordingly. If the offset is greater than half the width of the cell, you consider this to be a delete operation. The deleteOnDragRelease property acts as a flag that indicates whether or not the operation is a delete.
 And of course, when the gesture ends, you check the flag to see if the action was a delete or not (the user might have dragged the cell more than halfway and then dragged it back, effectively nullifying the delete operation). */
    
    func handlePan(recognizer: UIPanGestureRecognizer) {
        // 1
        if recognizer.state == .Began {
            // when the gesture begins, record the current center location
            originalCenter = center
        }
        // 2
        if recognizer.state == .Changed {
            let translation = recognizer.translationInView(self)
            center = CGPointMake(originalCenter.x + translation.x, originalCenter.y)
            // has the user dragged the item far enough to initiate a delete/complete?
            deleteOnDragRelease = frame.origin.x < -frame.size.width / 2.0
        }
        // 3
        if recognizer.state == .Ended {
            // the frame this cell had before user dragged it
            let originalFrame = CGRect(x: 0, y: frame.origin.y,
                                       width: bounds.size.width, height: bounds.size.height)
            if !deleteOnDragRelease {
                // if the item is not being deleted, snap back to the original location
                UIView.animateWithDuration(0.2, animations: {self.frame = originalFrame})
            }
        }
    }
    
/* This delegate method allows you to cancel the recognition of a gesture before it has begun. In this case, you determine whether the pan that is about to be initiated is horizontal or vertical. If it is vertical, you cancel the gesture recognizer, since you don’t want to handle any vertical pans.
 This is a very important step! Your cells are hosted within a vertically scrolling view. Failure to cancel a vertical pan renders the scroll view inoperable, and the to-do list will no longer scroll.
 Build and run this code, and you should find that you can now drag the items left or right. When you release, the item snaps back to the center, unless you drag it more than halfway across the screen to the left, indicating that the item should be deleted: */
    override func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
        if let panGestureRecognizer = gestureRecognizer as? UIPanGestureRecognizer {
            let translation = panGestureRecognizer.translationInView(superview!)
            if fabs(translation.x) > fabs(translation.y) {
                return true
            }
            return false
        }
        return false
    }
}