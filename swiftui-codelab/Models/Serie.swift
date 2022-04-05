//
//  Serie.swift
//  swiftui-codelab
//
//  Created by Jenny escobar on 5/04/22.
//

import Foundation

struct Serie: Codable {
  let title: String
  let genre: String
  let rating: Double
}

extension Serie {
  static var possibleGenres: [String] {
    [
      "Action",
      "Adventure",
      "Comedy",
      "Crime",
      "Drama",
      "Fantasy",
      "Family",
      "Horror",
      "Mystery",
      "Romance",
      "Sci-Fi",
      "Thriller",
    ]
  }
}
