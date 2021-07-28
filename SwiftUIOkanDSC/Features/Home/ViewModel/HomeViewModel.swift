//
//  HomeViewModel.swift
//  SwiftUIOkanDSC
//
//  Created by Veli Bacik on 28.07.2021.
//

import Foundation

protocol IHomeViewModel: ObservableObject {
    var isLoading: Bool { get set }
    var isError: Bool { get set }
    var isAddView: Bool { get set }
    var homeService: IHomeService { get }

    func changeLoading()
    func changeError()
    func changeAddView()
}

protocol IHomeViewOutput {
    func addModelAndClose(model: DogModel)
}

final class HomeViewModel: IHomeViewModel {
    let homeService: IHomeService
    @Published var isLoading: Bool = true
    @Published var isError: Bool = false
    @Published var isAddView: Bool = false
    @Published var dogItems: [DogModel] = []
    var errorMessage: String?


    init(homeService: IHomeService) {
        self.homeService = homeService
        fetchAllDatas()
    }

    func fetchAllDatas() {
        homeService.fetchDogDatas { items in
            self.changeLoading()
            self.dogItems = items
        } onFail: { error in
            self.changeLoading()
            self.changeError()
            self.errorMessage = error
        }

    }

}


extension HomeViewModel : IHomeViewOutput {
    func addModelAndClose(model: DogModel) {
        dogItems.append(model)
        changeAddView()
    }
}

//MARK: Change Loading

extension HomeViewModel {
    func changeLoading() {
        DispatchQueue.main.async {
            self.isLoading = !self.isLoading
        }
    }

    func changeError() {
        DispatchQueue.main.async {
            self.isLoading = !self.isLoading
        }
    }

    func changeAddView() {
        DispatchQueue.main.async {
            self.isAddView = !self.isAddView
        }
    }
}
