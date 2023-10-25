//
//  ContentView.swift
//  sorter
//
//  Created by Micah Beech on 2021-04-15.
//

import SwiftUI

struct SorterView: View {
    @ObservedObject var model: Model
    var title: String
    
    func barColor(_ index: Int) -> Color {
        return .init(
            red: Double(index) / Double(model.items.count) + 0.8,
            green: Double(model.items[index]) / Double(model.maxItem * 2) + 0.2,
            blue: 0
        )
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button("Sort") { model.sort() }
                
                Spacer()
                
                Button("Reset") { model.resetItems() }
            }
            .padding()
            
            GeometryReader { geo in
                VStack(alignment: .leading, spacing: 1) {
                    ForEach(model.items.indices, id: \.self) { index in
                        Rectangle()
                            .foregroundColor(barColor(index))
                            .frame(
                                width: CGFloat(model.items[index]) * geo.size.width / CGFloat(model.maxItem),
                                height: geo.size.height / CGFloat(model.items.count) - 1
                            )
                    }
                }
            }
            .padding([.bottom, .trailing])
        }
        .onAppear { model.resetItems() }
        .navigationTitle(title)
    }
}

struct SorterView_Previews: PreviewProvider {
    static var previews: some View {
        SorterView(model: Model(arraySize: 10, algorithm: SORTING_ALGORITHMS[0]), title: "Sort")
    }
}
