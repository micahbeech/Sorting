//
//  HomeView.swift
//  sorter
//
//  Created by Micah Beech on 2021-04-15.
//

import SwiftUI

struct HomeView: View {
    
    @State private var arraySize = 100.0
    @State private var algorithmIndex = (SORTING_ALGORITHMS.count - 1) / 2
    
    var body: some View {
        NavigationView {
            VStack(spacing: 100) {
                VStack {
                    Text("Array size: \(Int(arraySize))")
                        .font(.title)

                    Slider(value: $arraySize, in: Double(MIN_ARRAY_SIZE)...Double(MAX_ARRAY_SIZE))
                }
                
                VStack(spacing: 0) {
                    Text("Algorithm")
                        .font(.title)

                    Picker("Algorithm", selection: $algorithmIndex) {
                        ForEach(SORTING_ALGORITHMS.indices, id: \.self) { index in
                            Text("\(SORTING_ALGORITHMS[index]) Sort")
                        }
                    }
                }

                NavigationLink("Create!", destination: SorterView(model: Model(arraySize: Int(arraySize), algorithm: SORTING_ALGORITHMS[algorithmIndex]), title: "\(SORTING_ALGORITHMS[algorithmIndex]) Sort"))
            }
            .navigationBarHidden(true)
            .navigationViewStyle(StackNavigationViewStyle())
            .padding()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
