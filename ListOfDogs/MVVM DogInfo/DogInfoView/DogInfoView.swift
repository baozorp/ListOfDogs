//
//  DogInfoView.swift
//  ListOfDogs
//
//  Created by Михаил Шекунов on 23.06.2023.
//

import SwiftUI



struct DogInfoView: View {
    
    @State var dog: Dog
    
    var body: some View {
        ScrollView{
            Image(uiImage: dog.image)
                .resizable()
                .frame(width: UIScreen.main.bounds.size.width/2, height: UIScreen.main.bounds.size.width/2)
                .cornerRadius(30)
                .padding(.top, 40)
            
            Text("Age is \(dog.age) year")
                .padding(.bottom, 30)
            
            // Stack for name
            VStack{
                // Using two HStacks to color the background from edge to edge of the screen
                HStack{
                    Spacer()
                }
                Text(dog.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                HStack{
                    Spacer()
                }
            }.background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.blue)
                    .shadow(radius: 5)
                    .opacity(0.2))
            .padding(.horizontal, 10)
            
            //Stack for description
            VStack{
                HStack{
                    Spacer()
                }
                Text(dog.description)
                    .padding(.all, 20)
                HStack{
                    Spacer()
                        
                }
            }
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.green)
                    .shadow(radius: 5)
                    .opacity(0.2))
            .padding(.all, 10)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Dog's info")
    }
}


struct DogInfoView_Previews: PreviewProvider {
    static var previews: some View {
        let dog = Dog(id: 1, name: "Name", description: "Description", age: 1)
        DogInfoView(dog: dog)
    }
}

