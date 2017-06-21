//
//  ViewDraw.swift
//  TestCoreGraphics1Swift
//
//  Created by Robert Seitsinger on 10/20/15.
//  Copyright © 2015 cs378. All rights reserved.
//

import UIKit

class ViewDraw: UIView {

    fileprivate var pointPathsArray:Array<PointPath> = Array<PointPath>()
    fileprivate var colorToUse:UIColor = UIColor()
    fileprivate var currentPointPath:PointPath = PointPath()
    
    // This is called when a view is instantiated from an xib or storyboard
    override internal func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // Only override drawRect if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {

        if (pointPathsArray.count > 0) {
            
            let context = UIGraphicsGetCurrentContext()
            
            // Set how thick the line will be.
            context!.setLineWidth(3.0)
            
            // Iterate through the rest of the points
            for pointPath:PointPath in pointPathsArray {
                if (pointPath.points.count > 0) {
                    // Set the color for this path of points
                    context!.setStrokeColor(pointPath.color.cgColor)
                    // Start at the first point
                    let startingPoint = pointPath.points[0]
                    // Move the location of where we'll start drawing.
                    // Think of this as the place where the 'pen' starts drawing.
                    context!.move(to: CGPoint(x: startingPoint.x, y: startingPoint.y))
                    // Iterate throught the points, drawing the line segments
                    for point:CGPoint in pointPath.points {
                        context!.addLine(to: CGPoint(x: point.x, y: point.y))
                    }
                    // Make them appear in the view
                    context!.drawPath(using: .stroke)
                }
            }
        }
    }

    // This gets called when the user touches the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // Start with an empty points list for this path.
        self.currentPointPath = PointPath()
        // Remember the color to use for this path.
        self.currentPointPath.color = colorToUse

        super.touchesBegan(touches, with: event)

        self.captureTouchPoints(touches)

        // store the newly capture point array
        self.pointPathsArray.append(self.currentPointPath)

        // Trigger the drawing in drawRect
        setNeedsDisplay()
    }
    
    // This gets called as the user moves there finger in the view - without lifting it
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.captureTouchPoints(touches)
        
        // Trigger the drawing in drawRect
        setNeedsDisplay()
    }
    
    // This gets called when the user lifts their finger
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.captureTouchPoints(touches)
        
        // Trigger the drawing in drawRect
        setNeedsDisplay()
    }
    
    fileprivate func captureTouchPoints(_ touches: Set<UITouch>) {
        for touch: AnyObject in touches {
            // Get the x,y coordinate of the touch in this view's coordinate space.
            let location = touch.location(in: self)
            // And save it.
            self.currentPointPath.points.append(location)
        }
    }
    
    func setColor(color: UIColor) {
        self.colorToUse = color
    }
    
    func reset() {
        // Reset stuff to the starting state.
        self.pointPathsArray = Array<PointPath>()
        setNeedsDisplay()
    }

}

