//
//  SerieRowView.swift
//  swiftui-codelab
//
//  Created by Jenny escobar on 5/04/22.
//

import SwiftUI

struct SerieRowView: View {
  let serie: Serie

  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Text(serie.title)
          .font(.title)
        Text(serie.genre)
          .font(.caption)
      }
      Spacer()
      VStack(alignment: .trailing) {
        Spacer()
        RatingView(rating: serie.rating)
      }
    }
  }
}

struct SerieRowView_Previews: PreviewProvider {
    static var previews: some View {
        SerieRowView(serie: Serie(title: "American psico", genre: "Comedy", rating: 4.5))
    }
}
