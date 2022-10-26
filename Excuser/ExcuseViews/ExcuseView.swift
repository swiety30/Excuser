//
//  ExcuseView.swift
//  Excuser
//
//  Created by Paweł Świątek on 25/10/2022.
//

import SwiftUI

struct ExcuseView: View {
    @State private var excuse: Excuse?
    @State private var isFetching: Bool = false
    @State private var showingAlert = false
    @State var category: ExcuseCategory
    @ObservedObject var model: ExcuseModel
    
    var body: some View {
        VStack(alignment: .center) {
            Group {
                categoryTitle
                excuseDescription
                excuseLabel
            }
            .multilineTextAlignment(.center)
            .padding()
            Spacer()
            refreshButton
        }
        .toolbar {
            ToolbarItem() {
                ExcuseCategorySwitch(model: model,
                                     excuse: $excuse,
                                     category: $category)
            }
        }
        .onAppear {
            Task {
                await getNewExcuse()
            }
        }
        .padding()
    }

    var categoryTitle: some View {
        Group {
            Text("Your Excuse Category: ") +
            Text("\(category.name.firstLetterCapitalised())")
                .bold()
                .underline(true, color: .red)
        }
        .font(.title2)
    }

    var excuseDescription: some View {
        Group {
            if excuse == nil {
                Text("Here goes your new excuse..")
            } else {
                Text("Here is your **exsuse**, use it wisely..")
            }
        }
        .font(.body)
    }

    var excuseLabel: some View {
        AnimatedText(text: excuse?.title ?? "")
    }

    var refreshButton: some View {
        Button {
            Task {
                await getNewExcuse()
            }
        } label: {
            ZStack {
                Text("Refresh")
                if isFetching {
                    ProgressView()
                }
            }
        }
        .buttonStyle(GrowingButton(backgroundColor: isFetching ? .gray : .green,
                                   foregroundColor: .white))
        .disabled(isFetching)
        .padding()
        .alert("Something went wrong", isPresented: $showingAlert, actions: {
            Button("Refresh") {
                Task {
                    await getNewExcuse()
                }
            }
            Button("OK", role: .cancel, action: {})
        }, message: {
            Text("Please refresh or be satisfied with an old Excuse!")
        })
    }

    private func getNewExcuse() async {
        isFetching = true
        do {
            excuse = try await model.excuse(for: category)
            isFetching = false
        } catch {
            isFetching = false
            showingAlert = true
        }
    }
}

struct ExcuseView_Previews: PreviewProvider {
    static var previews: some View {
        ExcuseView(category: ExcuseCategory(name: "funny"),
                   model: ExcuseModel())
    }
}

public struct AnimatedText: View {
    var text: String
    @State private var animate = false

    public var body: some View {
        Text(text)
            .italic()
            .font(.title)
            .opacity(animate ? 1.0 : 0.0)
            .onChange(of: text) { newValue in
                animate = false
                withAnimation(Animation.spring().speed(0.9)) {
                    animate = true
                }
            }
    }
}
