//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Samarth Paboowal on 31/10/22.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var landmarksData: LandmarksData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        landmarksData.landmarks.filter { !showFavoritesOnly || $0.isFavorite }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle("Favorites only", isOn: $showFavoritesOnly)
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(LandmarksData())
    }
}
