//
//  SerieViewModel.swift
//  swiftui-codelab
//
//  Created by Jenny escobar on 5/04/22.
//

import Foundation
class SerieViewModel: ObservableObject {
    static let serieKey = "Movies"
    static let defaultSerie = [
        Serie(title: "American psico", genre: "Comedy", rating: 4.5),
        Serie(title: "Breaking Bad", genre: "Action", rating: 4.0)
    ]

    static func loadSeries() -> [Serie] {
        let savedSeries = UserDefaults.standard.object(forKey: SerieViewModel.serieKey)
        if let savedSeries = savedSeries as? Data {
            let decoder = JSONDecoder()
            return (try? decoder.decode([Serie].self, from: savedSeries))
            ?? SerieViewModel.defaultSerie
        }
        return SerieViewModel.defaultSerie
    }

    @Published var series = loadSeries() {
        didSet {
            persistSeries()
        }
    }

    func addSeries(title: String, genre: String, rating: Double) {
        let newSerie = Serie(title: title, genre: genre, rating: rating)
        series.append(newSerie)
    }

    func deleteSerie(at offsets: IndexSet) {
        series.remove(atOffsets: offsets)
    }

    private func persistSeries() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(series) {
            UserDefaults.standard.set(encoded, forKey: SerieViewModel.serieKey)
        }
    }
}
