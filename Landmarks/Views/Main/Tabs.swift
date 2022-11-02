//
//  Tabs.swift
//  Landmarks
//
//  Created by Samarth Paboowal on 02/11/22.
//

import SwiftUI

struct Tabs: View {
    @EnvironmentObject var landmarksData: LandmarksData
    @State private var selectedItem: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selectedItem) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

struct Tabs_Previews: PreviewProvider {
    static var previews: some View {
        Tabs()
            .environmentObject(LandmarksData())
    }
}
