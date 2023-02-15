//
//  MapView.swift
//  Africa
//
//  Created by Arthur on 30/01/2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    //MARK: - PROPERTIES
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")

    //MARK: - BODY
    var body: some View {
        // MARK: - No1 basic map
        // Map(coordinateRegion: $region)
        
        // MARK: - No2 Advanced map
        ZStack {
            Map(coordinateRegion: $region, annotationItems: locations) { item in
                // (A) Pin: Old style (always static)
                //MapPin(coordinate: item.location, tint:  .accentColor)
                
                // (B) Marker: New style (always static)
                //MapMarker(coordinate: item.location, tint: .accentColor)
                
                // (C) Custom basic Annotation (it could be interactive)
    //            MapAnnotation(coordinate: item.location) {
    //                Image("logo")
    //                    .resizable()
    //                    .scaledToFit()
    //                    .frame(width: 32, height: 32, alignment: .center)
    //            } //:MapAnnotation
                
                // (D) Custom Advanced Annotation (it could be interactive)
                MapAnnotation(coordinate: item.location) {
                    MapAnnotationView(location: item)
                }
            }//:Map
            .overlay (
                HStack(alignment: .center, spacing: 12){
                    Image("compass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48, alignment: .center)
                    
                    VStack(alignment: .leading, spacing: 3) {
                        HStack {
                            Text("Latitude:")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(.accentColor)
                            
                            Spacer()
                            
                            Text("\(region.center.latitude)")
                        } //:HStack
                        
                        Divider()
                        
                        HStack {
                            Text("Longitude:")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(.accentColor)
                            
                            Spacer()
                            
                            Text("\(region.center.longitude)")
                        } //:HStack
                    } //:VStack
                } //:HStack
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background {
                    Color.black
                        .cornerRadius(8)
                        .opacity(0.6)
                    }
                .padding()
                , alignment: .top
        )
        }
        
    }
}

//MARK: - PREVIEW
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
