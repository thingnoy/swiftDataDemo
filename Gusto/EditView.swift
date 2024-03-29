//
//  EditView.swift
//  Gusto
//
//  Created by supasai haplakhon on 18/1/24.
//

import SwiftUI
import SwiftData

struct EditView: View {
    @Environment(\.presentationMode)
    var presentationMode: Binding<PresentationMode>

    @Environment(\.modelContext)
    private var context

    @Bindable var item: Restaurant
    var isAdd: Bool = false

    var body: some View {
        Text(isAdd ? "Add" : "Edit")
        Text("\(item.Name)")

        VStack {

            Form {
                TextField("Name", text: $item.Name)

                Picker("PriceRaing", selection: $item.PriceRaing) {
                    Text("1").tag(1)
                    Text("2").tag(2)
                    Text("3").tag(3)
                    Text("4").tag(4)
                    Text("5").tag(5)
                }
                Picker("QtyRating", selection: $item.QtyRating) {
                    Text("1").tag(1)
                    Text("2").tag(2)
                    Text("3").tag(3)
                    Text("4").tag(4)
                    Text("5").tag(5)
                }
                Picker("SpeedRating", selection: $item.SpeedRating) {
                    Text("1").tag(1)
                    Text("2").tag(2)
                    Text("3").tag(3)
                    Text("4").tag(4)
                    Text("5").tag(5)
                }
            }

            HStack {
                Button(action: {
                    if isAdd {
                        context.insert(item)
                    }

                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: isAdd ? "plus" : "pencil")

                })
                .fontWeight(.bold)
                .font(.title)
                .padding()
                .background(Color.purple)
                .cornerRadius(40)
                .foregroundColor(.white)
                .padding(6)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.purple, lineWidth: 5)
                )

            }
            .padding()

        }
        .padding()
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Restaurant.self, configurations: config)
        let exam = Restaurant(Name: "", PriceRaing: 0, QtyRating: 0, SpeedRating: 0)
        return EditView(item: exam).modelContainer(container)
    } catch {
        fatalError("err")
    }
}
