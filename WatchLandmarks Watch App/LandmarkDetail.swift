//
//  LandmarkDetail.swift
//  WatchLandmarks Watch App
//
//  Created by Samarth Paboowal on 03/11/22.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var landmarksData: LandmarksData
    let landmark: Landmark
    var landmarkIndex: Int {
        landmarksData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        ScrollView {
            VStack {
                CircleImage(imageName: landmark.imageName, resizable: true)
                
                Text(landmark.name)
                    .font(.headline)
                    .lineLimit(0)
                
                Toggle(isOn: $landmarksData.landmarks[landmarkIndex].isFavorite) {
                    Text("Favorite")
                }
                
                Divider()
                
                Text(landmark.park)
                    .font(.caption)
                    .bold()
                    .lineLimit(0)
                
                Text(landmark.state)
                    .font(.caption)
                
                Divider()
                
                MapView(coordinate: landmark.locationCoordinates)
                    .scaledToFit()
            }
            .padding(.all, 16)
        }
        .navigationTitle("Landmarks")
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var landmarksData = LandmarksData()
    static var previews: some View {
        Group {
            LandmarkDetail(landmark: landmarksData.landmarks[0])
                .environmentObject(landmarksData)
                .previewDevice("Apple Watch Series 8 - 41mm")
            LandmarkDetail(landmark: landmarksData.landmarks[0])
                .environmentObject(landmarksData)
                .previewDevice("Apple Watch Series 8 - 45mm")
        }
    }
}
