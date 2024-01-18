//
//  ContentView.swift
//  Gusto
//
//  Created by supasai haplakhon on 18/1/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @Environment(\.modelContext)
    private var context

    @Query
    private var items: [Restaurant]

    var body: some View {
        NavigationStack {

            List {
                ForEach (items) { item in
                    NavigationLink(item.Name, value: item)
                }
                .onDelete { indexes in
                    for index in indexes {
                        deleteItem(items[index])
                    }
                }
            }


            .navigationTitle("Gusto Restaurant")
            .toolbar {
                ToolbarItem() {
                    NavigationLink(
                        destination: EditView(item: Restaurant(Name: "??", PriceRaing: 0, QtyRating: 0, SpeedRating: 0), isAdd: true)) {
                            Image(systemName: "plus")
                        }
                }
            }
            .navigationDestination(for: Restaurant.self) { item in
                EditView(item: item)
            }
        }


    }

    func addItem(_ index: Int = 0) {

        let items = [
            Restaurant(Name: "Wok this Way", PriceRaing: 40, QtyRating: 5, SpeedRating: 3),
            Restaurant(Name: "Thyme Square", PriceRaing: 30, QtyRating: 4, SpeedRating: 3),
            Restaurant(Name: "Pasta la Vista", PriceRaing: 20, QtyRating: 3, SpeedRating: 2),
            Restaurant(Name: "Life of Pie", PriceRaing: 10, QtyRating: 2, SpeedRating: 2),
            Restaurant(Name: "Lord of the Wings", PriceRaing: 8, QtyRating: 1, SpeedRating: 4)
        ]
        context.insert(items[index])
    }

    func deleteItem(_ item: Restaurant) {
        context.delete(item)
    }
}

#Preview {
    ContentView()
}
