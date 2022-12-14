//
//  MapView.swift
//  AfricaApp_SwiftUI
//
//  Created by Igor Ashurkov on 29.11.2022.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    // MARK: Properties
    
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var zoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: zoomLevel)
        
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    // MARK: Body
    
    var body: some View {
        // MARK: Basic Map
//        Map(coordinateRegion: $region)
        
        // MARK: Advanced Map
        Map(coordinateRegion: $region, annotationItems: self.locations, annotationContent: { item in
            // (A) PIN: OLD STYLE (always static)
//            MapPin(coordinate: item.location, tint: .accentColor)
            
            // (B) MARKER: NEW STYLE (always static)
//            MapMarker(coordinate: item.location, tint: .accentColor)
            
            // (C) CUSTOM BASIC ANNOTATION (it could be interactive)
//            MapAnnotation(coordinate: item.location) {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32, height: 32, alignment: .center)
//            } //: MapAnnotation
            
            // (D) CUSTOM ADVANCED ANNOTATION (it could be interactive)
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(model: item)
            }
        }) //: Map
        .overlay(
            HStack(alignment: .center, spacing: 12) {
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
                        Text("\(self.region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    } //: HStack
                    
                    Divider()
                    
                    HStack {
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(self.region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    } //: HStack
                } //: VStack
            } //: HStack
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(
                Color.black
                    .cornerRadius(8)
                    .opacity(0.6)
            )
            .padding()
            , alignment: .top
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
