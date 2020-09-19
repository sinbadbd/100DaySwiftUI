import UIKit
import SwiftUI
import Combine
import Foundation

var str = "Hello, playground"

[1,5,9]
.publisher
    .sink {print($0)}

let label = UILabel()
Just("Jhon")
    .map { "myc\($0)" }
    .assign(to: \.text, on: label)


