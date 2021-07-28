//
//  HomeView.swift
//  SwiftUIOkanDSC
//
//  Created by Veli Bacik on 28.07.2021.
//

import SwiftUI
import Kingfisher

struct HomeView: View {
    @StateObject var homeViewModel = HomeViewModel(homeService: HomeService())

    var body: some View {
        NavigationView {
            if homeViewModel.isLoading {
                ProgressView()
            } else {
                List.init(homeViewModel.dogItems, id: \.code) { item in
                    DogCardView(model: item)
                }.navigationBarTitle(Text("title"))
                .alert(isPresented: $homeViewModel.isError, content: {
                    Alert(title: Text("\(homeViewModel.errorMessage ?? "")"))
                })
                .navigationBarItems(trailing: Button(action: {
                    homeViewModel.changeAddView()
                }, label: {
                    Text("+").font(.largeTitle)
                })).fullScreenCover(isPresented: $homeViewModel.isAddView, content: {
                    DogAddView(delegate: homeViewModel)
                })
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
