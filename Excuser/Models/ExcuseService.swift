//
//  ExcuseService.swift
//  WeatherApp
//
//  Created by Paweł Świątek on 31/07/2022.
//

import SwiftUI

enum ExcuseServiceError: Error {
    case invalidURL
    case noExcuse
    case invalidResponse
}

struct ExcuseService {
    private let baseUrl = "https://excuser.herokuapp.com/v1/excuse/"

    func excuse(for category: ExcuseCategory) async throws -> Excuse {
        let stringUrl = baseUrl + category.name
        guard let url = URL(string: stringUrl) else {
            throw ExcuseServiceError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        do {
            let decoder = JSONDecoder()
            let excuses = try decoder.decode([Excuse].self, from: data)
            guard let excuse = excuses.first else { throw ExcuseServiceError.noExcuse }
            return excuse
        } catch {
            throw ExcuseServiceError.invalidResponse
        }
    }
}
