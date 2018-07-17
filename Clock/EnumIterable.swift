//
//  EnumIterable.swift
//  PocketSalon
//
//  Created by Joel Youngblood on 6/7/17.
//  Copyright © 2017 SalonBiz. All rights reserved.
//

//You can ignore all this code - it's from a pod and I've carried it around with me for a while - feel free to use it, it's super useful!

import Foundation

#if swift(>=4.2)

typealias EnumIterable = CaseIterable

extension CaseIterable {

    static var allValues: [Self] {
        return allCases.map { $0 }
    }

    static var count: Int {
        return allCases.count
    }
}

#else

public protocol EnumIterable {
    associatedtype EnumType: Hashable, RawRepresentable = Self
    static var allValues: [EnumType] { get }
    static var rawValues: [EnumType.RawValue] { get }
}

public extension EnumIterable {
    
    fileprivate static func enumerated() -> AnyIterator<EnumType> {
        var i: Int = 0
        return AnyIterator {
            let next = withUnsafePointer(to: &i) {
                $0.withMemoryRebound(to: EnumType.self, capacity: 0) {
                    $0.pointee
                }
            }
            
            // In Swift 4.2, the hashValue does not match the raw value, so we cannot perform
            // this check (I expect it is taking the hash of the raw value). But it does appear
            // to stop enumerating when needed, so we simply remove it.
            //let nextValue: EnumType? = next.hashValue == i ? next : nil
            
            i += 1
            return next
        }
    }
    
    static var allValues: [EnumType] {
        return enumerated().map { $0 }
    }
    
    static var rawValues: [EnumType.RawValue] {
        return allValues.map { $0.rawValue }
    }
}

public extension EnumIterable {
    
    static var count: Int {
        return allValues.count
    }
    
}

public protocol EnumSortable {
    var sortOrder: Int { get }
}

#endif
