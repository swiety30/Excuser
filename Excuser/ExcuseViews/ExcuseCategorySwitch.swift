//
//  ExcuseCategorySwitch.swift
//  Excuser
//
//  Created by Paweł Świątek on 25/10/2022.
//

import SwiftUI

struct ExcuseCategorySwitch: View {
    @StateObject var model: ExcuseModel
    @Binding var excuse: Excuse?
    @Binding var category: ExcuseCategory

    var body: some View {
        Menu {
            ForEach(model.categories) { category in
                Button {
                    Task {
                        self.category = category
                        self.excuse = nil
                        excuse = try await model.excuse(for: category)
                    }
                } label: {
                    MenuLabel(category: category.name, isChoosen: self.category == category)
                }
            }
        } label: {
            menuImage
        }
    }

    struct MenuLabel: View {
        let category: String
        let isChoosen: Bool
        var body: some View {
            HStack {
                Text(category.firstLetterCapitalised())
                if isChoosen {
                    Image(systemName: "arrow.up.arrow.down.square")
                }
            }
        }
    }

    var menuImage: some View {
        Image(systemName: "arrow.up.arrow.down.square")
    }
}
