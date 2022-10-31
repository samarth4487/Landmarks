//
//  Landmark.swift
//  Landmarks
//
//  Created by Samarth Paboowal on 31/10/22.
//

import Foundation
import CoreLocation

struct Landmark: Identifiable, Decodable {
    let id: Int
    let name: String
    let park: String
    let state: String
    let description: String
    let imageName: String
    let isFavorite: Bool
    private let coordinates: Coordinates
    
    var locationCoordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
}

struct Coordinates: Decodable {
    let latitude: Double
    let longitude: Double
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

let landmarks: [Landmark] = load("landmarkData.json")
