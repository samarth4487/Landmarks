//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Samarth Paboowal on 31/10/22.
//

import SwiftUI

struct LandmarkRow: View {
    let landmark: Landmark
    
    var body: some View {
        HStack {
            Image(landmark.imageName)
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var landmarks = LandmarksData().landmarks
    static var previews: some View {
        LandmarkRow(landmark: landmarks[0])
    }
}
