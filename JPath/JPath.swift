//
//  JPath.swift
//  JPath
//
//  Created by Richard Hodgkins on 03/08/2014.
//  Copyright (c) 2014 Rich Hodgkins. All rights reserved.
//

/// Empty protocol for adding to JSON types
public protocol JSON {}

// Add the JSON protocol to the allowed JSON types
extension Dictionary: JSON {}
extension Array: JSON {}
extension Bool: JSON {}
extension Int: JSON {}
extension UInt: JSON {}
extension Float: JSON {}
extension Double: JSON {}
extension String: JSON {}
extension NSNull: JSON {}

public extension String {
    
    ///
    ///
    ///
    /// @warning calling this method on an empty receiver will try to cast the object passed in and return it.
    public func evaluateJPath<T>(JSON: AnyObject?) -> T?
    {
        if (JSON is NSArray) {
            NSLog("JPath with JSON array types is not yet supported");
            return nil;
        }
        var result: AnyObject? = JSON;
        if (!self.isEmpty) {
            let components = self.componentsSeparatedByString("/");
            for fieldName in components {
                if let value: AnyObject = result?[fieldName]? {
                    result = value;
                } else {
                    // Invalid JPath
                    return nil;
                }
            }
        }
        // Try to return the correct type
        return result as? T;
    }
}
