//
//  DogsListViewModel.swift
//  ListOfDogs
//
//  Created by Михаил Шекунов on 23.06.2023.
//

import SwiftUI
import Moya

class DogsListViewModel: ObservableObject {
    
    @Published var dogs: [Dog] = []
    
    private let dogProvider = MoyaProvider<DogService>()
    
    func getDogInfo() {
        let newRequest: DogMoyaProtocol = DogMoya()
        newRequest.getDogInfo { dog in
            self.dogs.append(dog)
        }
    }
    
}
