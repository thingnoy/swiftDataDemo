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
                NavigationLink("Go to detail A", value: "Show AAAA")
                NavigationLink("Go to B", value: "Show BBB")
            }

            VStack {

                Text("Gusto Restaurant")

                Spacer()

                Button("Wok this Way") {
                    addItem(0)
                }

                Button("Thyme Square") {
                    addItem(1)
                }
                Button("Pasta la Vista") {
                    addItem(2)
                }
                Button("Life of Pie") {
                    addItem(3)
                }
                Button("Lord of the Wings") {
                    addItem(4)
                }


                List {
                    ForEach (items) { item in
                        HStack {
                            Text(item.Name)
                            Spacer()
                            Text("\(item.PriceRaing)")
                            Text("\(item.QtyRating)")
                            Text("\(item.SpeedRating)")

                            Button(action: {
                                NavigationLink("Go to B", value: "Show BBB")
                            }, label: {
                                Image(systemName: "pencil")
                            })
                        }
                    }

                    .onDelete { indexes in
                        for index in indexes {
                            deleteItem(items[index])
                        }
                    }
                }
            }
            .padding()

            .navigationDestination(for: String.self) { textValue in
                EditView()
            }
            .navigationTitle("Gusto Restaurant")
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
