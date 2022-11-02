//
//  CategoryItem.swift
//  Landmarks
//
//  Created by Samarth Paboowal on 02/11/22.
//

import SwiftUI

struct CategoryItem: View {
    let landmark: Landmark
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(landmark.imageName)
                .renderingMode(.original)
                .resizable()
                .frame(width: 150, height: 150)
                .cornerRadius(5)
            Text(landmark.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(landmark: LandmarksData().landmarks[0])
    }
}
