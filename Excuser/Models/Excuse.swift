//
//  Excuse.swift
//  Excuser
//
//  Created by Paweł Świątek on 24/10/2022.
//

import Foundation

struct Excuse: Decodable {
    let title: String
    let category: ExcuseCategory

    enum CodingKeys: String, CodingKey {
        case title = "excuse"
        case category
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let categoryName = try container.decode(String.self, forKey: .category)
        self.category = ExcuseCategory(name: categoryName)
        self.title = try container.decode(String.self, forKey: .title)
    }
}
