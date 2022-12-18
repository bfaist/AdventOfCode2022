//
//  GridDataModel.swift
//  AdventOfCodeDay8
//
//  Created by Robert Faist on 12/14/22.
//

import Foundation

enum GridDirection: String, CaseIterable {
    case left = "L"
    case right = "R"
    case top = "T"
    case bottom = "B"
}

struct GridDataModel {
    var grid: [[Int]] = []
}
