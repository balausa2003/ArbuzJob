//
//  Double + Extension.swift
//  ArbuzApp
//
//  Created by Балауса Косжанова on 18.05.2024.
//

import Foundation

extension Double {
    var clean: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(format: "%.1f", self)
    }
}
