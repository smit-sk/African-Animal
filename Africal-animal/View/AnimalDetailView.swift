//
//  AnimalDetailView.swift
//  Africal-animal
//
//  Created by SMIT KHOKHARIYA on 2024-02-26.
//

import SwiftUI

struct AnimalDetailView: View {
    
    let animal: AnimalModel
    
    var body: some View {
        ScrollView(.vertical , showsIndicators: false){
            VStack(alignment: .center, spacing: 20){
                // Hero Image
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                // Title
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y:24)
                    )
                // Headline
                
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                
                // Gallery
                
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                    
                    InsetGalleryView(animal: animal)
                }.padding(.horizontal)
                
                //Facts
                
                Group{
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                    InsetFactView(animal: animal)
                }
                .padding(.horizontal)
                
                // Description
                
                Group{
                    HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                    
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)
                
                
                // MAP
                
                Group{
                
                    HeadingView(headingImage: "map", headingText: "National Park")
                    InsetMapView()
                    
                }
                .padding(.horizontal)
                
                // LINK
                
                Group{
                    HeadingView(headingImage: "books.vertical", headingText: "Learn More")
                    
                    ExternalWebView(animal: animal)
                    
                }
                .padding(.horizontal)
                
            }// VSTACK
            .navigationBarTitle("Learn about \(animal.name)", displayMode: .inline)
        }// SCROLLVIEW
    }
}

struct AnimalDetailView_Previews : PreviewProvider {
    static let animal : [AnimalModel] =
        Bundle.main.decode("animals.json")
    
    static var previews: some View {
        NavigationView {
            AnimalDetailView(animal: animal[0])
        }
            .previewLayout(.sizeThatFits)
            .padding()
            
    }
}


