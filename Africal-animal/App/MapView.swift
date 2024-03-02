//
//  MapView.swift
//  Africal-animal
//
//  Created by SMIT KHOKHARIYA on 2024-02-23.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
        
    }()
    
    let location: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    var body: some View {
        // MARK 1. - no1 BASIC MAP
        //        Map(coordinateRegion: $region)
        
        
        //MARK 2 - no2 ADVANCED MAP
        
        Map(coordinateRegion: $region, annotationItems: location, annotationContent:
                {item in
            // (a) PIN: OLD STYLE ALWAYS STATIC
            //            MapPin(coordinate: item.location, tint: .accent)
            
            // (B) MARKER: NEW STYLE(always static)
            //MapMarker(coordinate: item.location, tint: .accentColor)
            
            // (C) Custom Basic Annotation ()
            //            MapAnnotation(coordinate: item.location){
            //                Image("logo")
            //                    .resizable()
            //                    .scaledToFit()
            //                    .frame(width:32, height: 32, alignment: .center)
            //                }
            
            // (D) Custom Advanced Annotation
            MapAnnotation(coordinate: item.location){
                MapAnnotationView(location: item)
            }
            
            
        })
        .overlay(
            HStack (alignment: .center, spacing:12){
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .trailing, spacing: 3){
                    HStack{
                        Text("Latitude: ")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    Divider()
                    HStack{
                        Text("Longitude: ")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                }
                
            }
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(
                    Color.black.cornerRadius(8).opacity(0.6))
                .padding()
            , alignment: .top
        )
    }
}

#Preview {
    MapView()
}
