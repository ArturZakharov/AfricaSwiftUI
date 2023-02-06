//
//  InsetMapView.swift
//  Africa
//
//  Created by Arthur on 06/02/2023.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    //MARK: - PROPERTIES
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599),span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
    
    //MARK: - BODY
    var body: some View {
        Map(coordinateRegion: $region)
            .frame(height: 256)
            .cornerRadius(12)
    }
}

//MARK: - PREVIEW
struct InsetMapView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsetMapView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
