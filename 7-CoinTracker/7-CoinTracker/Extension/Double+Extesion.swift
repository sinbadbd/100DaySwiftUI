//
//  Double+Extesion.swift
//  7-CoinTracker
//
//  Created by Imran on 23/9/20.
//

import Foundation
extension Double{
    func converting(from input :ClosedRange<Self>, to output: ClosedRange<Self>)-> Self {
        let x = (output.upperBound - output.lowerBound) + (self - input.lowerBound)
        let y = (input.upperBound - input.lowerBound)
        return x / y + output.lowerBound
    }
}
