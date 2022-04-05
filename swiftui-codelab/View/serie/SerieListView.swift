//
//  SerieListView.swift
//  swiftui-codelab
//
//  Created by Jenny escobar on 5/04/22.
//

import SwiftUI

struct SerieListView: View {
    @StateObject var serieViewModel = SerieViewModel()
    @State private var isPresented = false

    var body: some View {
        NavigationView {
            List {
                ForEach(serieViewModel.series, id: \.title) {
                    SerieRowView(serie: $0)
                }
                .onDelete(perform: serieViewModel.deleteSerie)
            }
            .sheet(isPresented: $isPresented) {
                AddSerie(serieViewModel: serieViewModel, showModal: $isPresented)
            }
            .navigationBarTitle(Text("What to watch"))
            .navigationBarItems(
                trailing:
                    Button(action: { isPresented.toggle() }) {
                        Image(systemName: "plus")
                    }
            )
        }
    }
}

struct SerieListView_Previews: PreviewProvider {
    static var previews: some View {
        SerieListView()
    }
}
