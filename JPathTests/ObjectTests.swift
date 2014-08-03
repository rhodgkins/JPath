//
//  ObjectTests.swift
//  JPath
//
//  Created by Richard Hodgkins on 03/08/2014.
//  Copyright (c) 2014 Rich Hodgkins. All rights reserved.
//

import JPath;
import XCTest

let JSONString = "{ \"top_level\" : { \"inner_string\" : \"string\", \"inner_int\" : 12, \"inner_array\" : [ 1, 2, 3], \"inner_bool\" : true, \"inner_float\" : 1.3, \"inner_double\" : 1e3 }, \"null_object\" : null, \"object\" : { \"key\" : \"value\" } }";

class ObjectTests: XCTestCase {
    
    let JSON: AnyObject! = NSJSONSerialization.JSONObjectWithData(JSONString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false), options: nil, error: nil);
    
    func testPassingInNil()
    {
        let result: AnyObject? = "top_level/inner_string".evaluateJPath(nil);
        XCTAssertNil(result, "Expecting nil");
    }
    
    /// Should return the same object as passed in
    func testEmptyJPath()
    {
        let result: NSDictionary? = "".evaluateJPath(self.JSON) as NSDictionary?;
        XCTAssertTrue(result?.isEqual(self.JSON), "Not the same object as passed in");
    }
    
    func testNull()
    {
        let result = "null_object".evaluateJPath(self.JSON) as NSNull?;
        XCTAssertTrue(result === NSNull(), "Not null");
        let nilString = "null_object".evaluateJPath(self.JSON) as NSString?;
        XCTAssertNil(nilString, "Should be nil");
    }
    
    func testInt()
    {
        let result: Int? = "top_level/inner_int".evaluateJPath(self.JSON) as NSNumber?;
        if let r = result? {
            XCTAssertEqual(r, 12, "Incorrect int");
        } else {
            XCTFail("Unable to unwrap");
        }
    }
    
    func testUInt()
    {
        let result: UInt? = "top_level/inner_int".evaluateJPath(self.JSON) as NSNumber?;
        if let r = result? {
            XCTAssertEqual(r, 12, "Incorrect int");
        } else {
            XCTFail("Unable to unwrap");
        }
    }
    
    func testBool()
    {
        let result: Bool? = "top_level/inner_bool".evaluateJPath(self.JSON) as NSNumber?;
        if let r = result? {
            XCTAssertTrue(r, "Incorrect boolean");
        } else {
            XCTFail("Unable to unwrap");
        }
    }
    
    func testFloat()
    {
        let result: Float? = "top_level/inner_float".evaluateJPath(self.JSON) as NSNumber?;
        if let r = result? {
            XCTAssertEqual(r, 1.3, "Incorrect float");
        } else {
            XCTFail("Unable to unwrap");
        }
    }
    
    func testDouble()
    {
        let result: Double? = "top_level/inner_double".evaluateJPath(self.JSON) as NSNumber?;
        if let r = result? {
            XCTAssertEqual(r, 1000, "Incorrect double");
        } else {
            XCTFail("Unable to unwrap");
        }
    }
    
    func testString()
    {
        let result: String? = "top_level/inner_string".evaluateJPath(self.JSON) as NSString?;
        if let r = result? {
            XCTAssertEqual(r, "string", "Incorrect string");
        } else {
            XCTFail("Unable to unwrap");
        }
        let intString: String? = "top_level/inner_int".evaluateJPath(self.JSON) as NSString?;
        XCTAssertNil(intString, "Should be nil");
    }
    
    func testDictionary()
    {
        let result: Dictionary? = "object".evaluateJPath(self.JSON) as NSDictionary?;
        let expecting = ["key" : "value"];
        XCTAssertTrue((result as [String : String]) == expecting, "Incorrect dictionary");
    }
    
    func testArray()
    {
        let result: Array? = "top_level/inner_array".evaluateJPath(self.JSON) as NSArray?;
        var expecting = [1, 2, 3];
        XCTAssertTrue((result as [Int]) == expecting, "Incorrect dictionary");
    }
}
