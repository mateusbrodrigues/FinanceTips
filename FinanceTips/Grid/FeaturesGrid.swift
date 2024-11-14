//
//  FeaturesGrid.swift
//  FinanceTips
//
//  Created by Mateus on 13/11/24.
//

import SwiftUI

struct FeaturesGrid: View {
    var gridLayout: [GridItem]{
        return Array(repeating: GridItem(.flexible()), count: 1)
    }
                     
    var body: some View {
        ScrollView(.horizontal){
            LazyHGrid(rows: gridLayout){
                ForEach(servicesMock) {
                    service in FeatureType(service: service)}
            }.frame(height: 200).padding(.horizontal,15).padding(.top,15)
        }

    }
    
}

#Preview {
    FeaturesGrid()
}
