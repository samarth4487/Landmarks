//
//  CircleImage.swift
//  Landmarks
//
//  Created by Samarth Paboowal on 31/10/22.
//

import SwiftUI

struct CircleImage: View {
    let imageName: String
    let resizable: Bool
    
    var body: some View {
        if resizable {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 7)
        } else {
            Image(imageName)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 7)
        }
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var landmarks = LandmarksData().landmarks
    static var previews: some View {
        CircleImage(imageName: landmarks[0].imageName, resizable: false)
    }
}
