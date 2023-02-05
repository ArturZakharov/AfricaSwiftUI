//
//  CaruselGalleryView.swift
//  Africa
//
//  Created by ArturZaharov on 02.02.2023.
//

import SwiftUI

struct CaruselGalleryView: View {
    //MARK: - PROPERTIES
    let animal: Animal
    
    //MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15){
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    .cornerRadius(12)
                }
            } //: Hstack
        } //: Scroll
    }
}

//MARK: - PREVIEW
struct CaruselGalleryView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        CaruselGalleryView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
