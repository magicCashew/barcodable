//
// InvalidCode.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation


public class InvalidCode: JSONEncodable {
    public var message: String?
    public var status: Int32?

    public init() {}

    // MARK: JSONEncodable
    func encodeToJSON() -> AnyObject {
        var nillableDictionary = [String:AnyObject?]()
        nillableDictionary["message"] = self.message
        nillableDictionary["status"] = self.status?.encodeToJSON()
        let dictionary: [String:AnyObject] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
