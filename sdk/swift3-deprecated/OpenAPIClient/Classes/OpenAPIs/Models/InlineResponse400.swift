//
// InlineResponse400.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation


open class InlineResponse400: JSONEncodable {

    public var message: String?
    public var status: Int32?

    public init() {}

    // MARK: JSONEncodable
    open func encodeToJSON() -> Any {
        var nillableDictionary = [String:Any?]()
        nillableDictionary["message"] = self.message
        nillableDictionary["status"] = self.status?.encodeToJSON()

        let dictionary: [String:Any] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}

