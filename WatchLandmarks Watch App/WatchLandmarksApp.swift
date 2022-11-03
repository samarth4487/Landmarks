//
//  WatchLandmarksApp.swift
//  WatchLandmarks Watch App
//
//  Created by Samarth Paboowal on 03/11/22.
//

import SwiftUI

@main
struct WatchLandmarks_Watch_AppApp: App {
    private var landmarksData = LandmarksData()
    
    var body: some Scene {
        WindowGroup {
            LandmarkList()
                .environmentObject(landmarksData)
        }
    }
}
