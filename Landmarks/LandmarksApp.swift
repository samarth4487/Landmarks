//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Samarth Paboowal on 31/10/22.
//

import SwiftUI

@main
struct LandmarksApp: App {
    private var landmarksData = LandmarksData()
    
    var body: some Scene {
        WindowGroup {
            LandmarkList()
                .environmentObject(landmarksData)
        }
    }
}
