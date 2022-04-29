//
//  StarRate.swift
//  zPhoto
//
//  Created by Ryan Zi on 4/14/22.
//

import Foundation

enum StarRate: Int8, Comparable{
    static func < (lhs: StarRate, rhs: StarRate) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
    case Zero   = 0
    case One    = 1
    case Two    = 2
    case Three  = 3
    case Four   = 4
    case Five   = 5
}
