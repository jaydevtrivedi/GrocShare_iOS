//
//  Counter.swift
//  Grocshare
//
//  Created by Jaydev Trivedi on 12/3/2024.
//

import Foundation

struct Counter {
    var value: Int
    
    mutating func increment(){
        value += 1
    }
    
    mutating func decrement(){
        value -= 1
    }
}
