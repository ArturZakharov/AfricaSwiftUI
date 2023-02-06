//
//  AnimalDetailView.swift
//  Africa
//
//  Created by ArturZaharov on 02.02.2023.
//

import SwiftUI

struct AnimalDetailView: View {
    //MARK: - PROPERTIES
    let animal: Animal
    
    //MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .center, spacing: 20) {
                //Hero Image
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                //Title
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24)
                    )
                
                //Headline
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                //Gallery
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                        .padding(.horizontal)
                    CarouselGalleryView(animal: animal)
                }
                
                //Facts
                Group {
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                    InsetFactView(animal: animal)
                }
                
                //Description
                Group {
                    HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                
                //Map
                Group {
                    HeadingView(headingImage: "map", headingText: "National Parks")
                    
                    InsetMapView()
                }
                
                //Link
                Group {
                    HeadingView(headingImage: "books.vertical", headingText: "Learn More")
                    
                    ExternalWeblinkView(animal: animal)
                }
                
            } //: Vstack
//            .navigationTitle("Learn about \(animal.name)")
            .navigationBarTitle("Learn about \(animal.name)", displayMode: .inline)
        } //: Scroll
        
    }
}

//MARK: - PREVIEW
struct AnimalDetailView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        NavigationView {
            AnimalDetailView(animal: animals[0])
        }
        .previewDevice("iPhone 12 Pro")
    }
}
