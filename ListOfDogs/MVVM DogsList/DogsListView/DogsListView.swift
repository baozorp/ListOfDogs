//
//  DogsListView.swift
//  ListOfDogs
//
//  Created by Михаил Шекунов on 23.06.2023.
//

import SwiftUI

struct DogsListView: View {
    @StateObject private var dogViewModel = DogsListViewModel()
    
    var body: some View {
        NavigationView {
            List(dogViewModel.dogs) { dog in
                NavigationLink(destination: DogInfoView(dog: dog)) {
                    DogCell(dog: dog)
                }
                .listRowBackground(Color.clear)
            }
            .navigationTitle("List of dogs")
        }
        .onAppear {
            dogViewModel.getDogInfo()
        }
    }
}

struct DogCell: View {
    
    @StateObject var dog: Dog
    
    var body: some View {
        HStack {
            Image(uiImage: dog.image)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(20)
            Spacer()
            VStack(alignment: .trailing) {
                Text(dog.name)
                    .font(.title2)
                    .fontWeight(.bold)
                    .lineLimit(1)
                Text(dog.description.components(separatedBy: ":").first ?? "")
                    .lineLimit(1)
                Text("Age is \(dog.age) years")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DogsListView()
    }
}
