//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Samarth Paboowal on 31/10/22.
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
            MapView(coordinate: landmark.locationCoordinates)
                .frame(height: 300)
            CircleImage(imageName: landmark.imageName, resizable: false)
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $landmarksData.landmarks[landmarkIndex].isFavorite)
                }
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                Divider()
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
            Spacer()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var landmarks = LandmarksData().landmarks
    static var previews: some View {
        LandmarkDetail(landmark: landmarks[0])
            .environmentObject(LandmarksData())
    }
}
