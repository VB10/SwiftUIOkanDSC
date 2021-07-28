//
//  DogCardView.swift
//  SwiftUIOkanDSC
//
//  Created by Veli Bacik on 28.07.2021.
//

import SwiftUI
import Kingfisher

struct DogCardView: View {

    let model: DogModel

    var body: some View {
        VStack {
            Text(model.welcomeDescription)
            KFImage(URL(string: model.imageURL) ?? URL.deafultImageUrl).resizable().frame(height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }.padding()
    }
}

struct DogCardView_Previews: PreviewProvider {
    static var previews: some View {
        DogCardView(model: DogModel(code: 300, welcomeDescription: "Asdasd", imageURL: "")).previewLayout(.sizeThatFits)
    }
}
