//
//  ExcuseModel.swift
//  Excuser
//
//  Created by Paweł Świątek on 24/10/2022.
//

import Foundation

@MainActor
class ExcuseModel: ObservableObject {
    @Published private(set) var categories: [ExcuseCategory] = []
    private let excuseService: ExcuseService

    init(excuseService: ExcuseService = ExcuseService()) {
        self.excuseService = excuseService
    }
    
    func fetchCategories() {
        do {
            guard let path = Bundle.main.path(forResource: "categories", ofType: "json") else { return }
            let url = URL(fileURLWithPath: path)
            let data = try Data(contentsOf: url)
            let categoryNames = try JSONDecoder().decode([String].self, from: data)
            categoryNames.forEach { categories.append(ExcuseCategory(name: $0)) }
        } catch {
            print("Error happened \(error)")
        }
    }

    func excuse(for category: ExcuseCategory) async throws -> Excuse {
        try await excuseService.excuse(for: category)
    }
}
