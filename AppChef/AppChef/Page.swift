//
//  Page.swift
//  AppChef
//
//  Created by Bartlomiej Siemieniuk on 13/11/2014.
//  Copyright (c) 2014 TeamGoat. All rights reserved.
//

import Foundation
import UIKit

class Page {
    
    var elememnts : [Element] = []
    var screenshot : UIImage?
    var view : UIView
    
    init() {
        self.view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height))
        self.view.backgroundColor = UIColor.whiteColor()
        self.updateScreenshot()
    }
    
    func updateScreenshot() {
        UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, true, 1)
        self.view.drawViewHierarchyInRect(self.view.bounds, afterScreenUpdates: true)
        
        let screenshot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.screenshot = screenshot;
    }
    
    func addElement(uiViewElementToBeAdded: UIView) {
        let element = Element(uiElement: uiViewElementToBeAdded)
        self.elememnts.append(element)
        self.view.addSubview(uiViewElementToBeAdded)
    }
    
    func toJSON() -> NSString {
        return "hello"
    }
}