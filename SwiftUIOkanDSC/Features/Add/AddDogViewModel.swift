//
//  AddDogViewModel.swift
//  SwiftUIOkanDSC
//
//  Created by Veli Bacik on 28.07.2021.
//

import Foundation

class AddDogViewModel: ObservableObject {
    private var homeViewOutput: IHomeViewOutput?
    
    @Published var code:String = ""
    @Published var descripiton:String = ""
    @Published var imageUrl:String = ""
    
    var isValidate: Bool {
        return code.isEmpty || descripiton.isEmpty || imageUrl.isEmpty
    }
    
    
    init(homeViewOutput: IHomeViewOutput? = nil) {
        self.homeViewOutput = homeViewOutput
    }

    func setDelegate(homeViewOutput: IHomeViewOutput?) {
        self.homeViewOutput = homeViewOutput
    }
    
    func addAndClose() {
        homeViewOutput?.addModelAndClose(model: DogModel(code: Int(code) ?? 44040, welcomeDescription: descripiton, imageURL: ""))
    }

}
