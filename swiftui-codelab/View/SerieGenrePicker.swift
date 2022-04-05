//
//  SerieGenrePicker.swift
//  swiftui-codelab
//
//  Created by Jenny escobar on 5/04/22.
//

import SwiftUI

struct GenrePicker: View {
  @Binding var genre: String

  var body: some View {
    Picker(selection: $genre, label: Spacer()) {
      ForEach(Serie.possibleGenres, id: \.self) {
        Text($0)
      }
    }
    .pickerStyle(WheelPickerStyle())
  }
}

struct GenrePicker_Previews: PreviewProvider {
  static var previews: some View {
    GenrePicker(genre: .constant("Comedy"))
  }
}
