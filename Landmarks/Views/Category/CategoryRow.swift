//
//  CategoryRow.swift
//  Landmarks
//
//  Created by Samarth Paboowal on 02/11/22.
//

import SwiftUI

struct CategoryRow: View {
    let categoryName: String
    let landmarks: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(landmarks) { landmark in
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
                .padding(.trailing, 15)
            }
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var landmarks = LandmarksData().landmarks
    static var previews: some View {
        CategoryRow(categoryName: landmarks[0].category.rawValue, landmarks: landmarks)
    }
}
