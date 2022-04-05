//
//  AddSerie.swift
//  swiftui-codelab
//
//  Created by Jenny escobar on 5/04/22.
//

import SwiftUI

struct AddSerie: View {
  static let defaultMovieTitle = "untitled"
  static let defaultMovieGenre = Serie.possibleGenres.first ?? "Genre-buster"

    let serieViewModel: SerieViewModel
    @Binding var showModal: Bool
    @State private var title = ""
    @State private var genre = ""
    @State private var rating: Double = 0

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Title")) {
                    TextField("Title", text: $title)
                }
                Section(header: Text("Genre")) {
                    GenrePicker(genre: $genre)
                }
                Section(header: Text("Rating")) {
                    Slider(value: $rating, in: 0...5, step: 0.5)
                    RatingView(rating: rating)
                }
            }
            .navigationBarTitle(Text("Add Serie record"), displayMode: .inline)
            .navigationBarItems(
                trailing:
                    Button(action: addSerie) {
                        Text("Add")
                    }
            )
        }
    }

    private func addSerie() {
        serieViewModel.addSeries(
            title: title.isEmpty ? AddSerie.defaultMovieTitle : title,
            genre: genre.isEmpty ? AddSerie.defaultMovieGenre : genre,
            rating: rating)
        showModal.toggle()
    }
}

struct AddSerie_Previews: PreviewProvider {
    static var previews: some View {
        AddSerie(serieViewModel: SerieViewModel(), showModal: .constant(true))
    }
}
