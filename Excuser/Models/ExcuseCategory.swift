//
//  ExcuseCategory.swift
//  Excuser
//
//  Created by Paweł Świątek on 24/10/2022.
//

import Foundation

struct ExcuseCategory: Identifiable {
    let id = UUID()
    let name: String
}

extension ExcuseCategory: Decodable {
    enum CodingKeys: String, CodingKey {
         case name
     }
}

extension ExcuseCategory: Equatable {}
