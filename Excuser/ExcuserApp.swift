//
//  ExcuserApp.swift
//  Excuser
//
//  Created by Paweł Świątek on 24/10/2022.
//

import SwiftUI

@main
struct ExcuserApp: App {
    var body: some Scene {
        WindowGroup {
            ExcuseCategoryListView(model: ExcuseModel())
        }
    }
}
