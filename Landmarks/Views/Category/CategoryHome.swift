//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Samarth Paboowal on 02/11/22.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var landmarksData: LandmarksData
    
    var body: some View {
        NavigationView {
            List {
                Carousel(landmarks: landmarksData.featured)
                    .listRowInsets(EdgeInsets())

                ForEach(landmarksData.categories.keys.sorted(), id: \.self) { categoryName in
                    CategoryRow(categoryName: categoryName, landmarks: landmarksData.categories[categoryName]!)
                        .padding(.top, 20)
                }
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Featured")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(LandmarksData())
    }
}
