//
//  Element.swift
//  AppChef
//
//  Created by Bartlomiej Siemieniuk on 13/11/2014.
//  Copyright (c) 2014 TeamGoat. All rights reserved.
//

import Foundation
import UIKit

class Element {
    var uiElement : UIView
    var type:  String
    var cellElements: [Element] = []
    var source : Int?
    
    init(uiElement: UIView, type: String) {
        self.uiElement = uiElement
        self.type      = type
    }
    
    func toJSON() -> NSString {
        return Helper.JSONStringify(self.toDictionary(), prettyPrinted: false)
    }
    
    func elementToDictionary(element:Element) -> [String: AnyObject] {
        var dictionary = [String: AnyObject]()
        
        dictionary["type"]  = "\(self.type)";
        dictionary["id"]    = 0
        dictionary["frame"] = [
            "x"      : "\(element.uiElement.frame.origin.x)",
            "y"      : "\(element.uiElement.frame.origin.y)",
            "width"  : "\(element.uiElement.frame.size.width)",
            "height" : "\(element.uiElement.frame.size.height)"
        ];
        
        if(self.type == "button") {
            let button = self.uiElement as UIButton;
            dictionary["text"]      = button.titleLabel!.text
            dictionary["textColor"] = button.titleLabel!.textColor
            
        } else if (self.type == "label") {
            let label = self.uiElement as UILabel;
            
            dictionary["text"]      = label.text
            dictionary["textColor"] = label.textColor
            
        } else if (self.type == "input") {
            let label = self.uiElement as UILabel;
            
            dictionary["text"]          = label.text
            dictionary["textColor"]     = label.textColor
            dictionary["background"]    = label.backgroundColor
            
        } else if (self.type == "image") {
            
        } else if (self.type == "list") {
            dictionary["source"] = element.source
        }
        return dictionary;
    }
    
    func toDictionary() -> [String: AnyObject] {
        var dictionary = self.elementToDictionary(self)
        
        if self.type == "list" {
           
            var cellElements: [AnyObject] = []
            for element in cellElements {
                cellElements.append(self.elementToDictionary(element as Element))
            }
            
            dictionary["cell"] = cellElements
        }
        
        return self.toDictionary()
    }
}