//
//  Carousel.swift
//  Landmarks
//
//  Created by Samarth Paboowal on 02/11/22.
//

import SwiftUI

struct Carousel: View {
    let landmarks: [Landmark]
    
    var body: some View {
        TabView {
            ForEach(landmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    Image(landmark.imageName)
                        .resizable()
                        .scaledToFill()
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: 250)
        .tabViewStyle(PageTabViewStyle())
    }
}

struct Carousel_Previews: PreviewProvider {
    static var previews: some View {
        Carousel(landmarks: LandmarksData().featured)
    }
}
