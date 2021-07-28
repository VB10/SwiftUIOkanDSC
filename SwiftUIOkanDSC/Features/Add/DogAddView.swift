//
//  DogAddView.swift
//  SwiftUIOkanDSC
//
//  Created by Veli Bacik on 28.07.2021.
//

import SwiftUI

struct DogAddView: View {
    
    @StateObject var addDogViewModel = AddDogViewModel()
    
    let delegate: IHomeViewOutput?
    
    
    var body: some View {
        Form {
            Section {
                TextField("Code", text: $addDogViewModel.code)
            }
            TextEditor(text: $addDogViewModel.descripiton).frame(height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            TextField("Image Url", text: $addDogViewModel.imageUrl)
            Section {
                Button(action: {
                    addDogViewModel.addAndClose()
                }, label: {
                        Text("Add and Close")
                }).frame( maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).disabled(addDogViewModel.isValidate)
            }
        }.onAppear(perform: {
            addDogViewModel.setDelegate(homeViewOutput: delegate)
        })
    }
}

struct DogAddView_Previews: PreviewProvider {
    static var previews: some View {
        DogAddView(delegate: nil)
    }
}
