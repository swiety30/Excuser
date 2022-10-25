//
//  ExcuseCategoryListView.swift
//  Excuser
//
//  Created by Paweł Świątek on 24/10/2022.
//

import SwiftUI

struct ExcuseCategoryListView: View {
    @ObservedObject var model: ExcuseModel

    init(model: ExcuseModel) {
        self.model = model
        model.fetchCategories()
    }

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView(showsIndicators: false) {
                    VStack {
                        Text("Select your excuse category")
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                            ForEach(model.categories) { category in
                                NavigationLink(destination:
                                                ExcuseView(category: category,
                                                           model: model)) {
                                    ExcuseCategoryView(title: category.name,
                                                       viewWidth: geometry.size.width / 2 - 10)
                                }
                            }
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}

struct ExcuseCategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        ExcuseCategoryListView(model: ExcuseModel())
    }
}
