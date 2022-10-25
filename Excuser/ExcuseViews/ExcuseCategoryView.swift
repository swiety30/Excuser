//
//  ExcuseCategoryView.swift
//  Excuser
//
//  Created by Paweł Świątek on 24/10/2022.
//

import SwiftUI

struct ExcuseCategoryView: View {
    let title: String
    let viewWidth: CGFloat
    var body: some View {
        VStack {
            let color = Color.random
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(color)
                .frame(minWidth: viewWidth,
                       minHeight: viewWidth,
                       maxHeight: .infinity)
            Text(title)
                .font(.title)
                .foregroundColor(.black)
                .bold()
                .italic()
        }
    }
}

struct ExcuseCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        ExcuseCategoryView(title: "Funny", viewWidth: 300)
    }
}
