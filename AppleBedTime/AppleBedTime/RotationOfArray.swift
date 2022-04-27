//
//  RotationOfArray.swift
//  AppleBedTime
//
//  Created by Imran on 27/4/22.
//

import Foundation
import SwiftUI

struct RotationOfArray {
     
     var startIndex: Int = 0
     var endIndex: Int = 0
 
    mutating func getStarAndEndIndex(arrData: inout [Int]) -> [Int] {
        startIndex = 0
        endIndex = arrData.count - 1
 
        while startIndex < endIndex {
            arrData.swapAt(startIndex, endIndex)
            startIndex = startIndex + 1
            //print("startIndex: \(startIndex)")
            endIndex = endIndex - 1
            //print("endIndex: \(endIndex)")
        }
        return arrData
    }
    
    
}

