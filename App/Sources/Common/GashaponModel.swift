//
//  GashaponModel.swift
//  Gashapon
//
//  Created by Euigyom Kim on 2022/08/18.
//

import Foundation

enum Gashapon {
    struct Name: Identifiable, Hashable {
        let id = UUID()
        let name: String
    }
}
