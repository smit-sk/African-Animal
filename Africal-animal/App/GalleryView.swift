//
//  GalleryView.swift
//  Africal-animal
//
//  Created by SMIT KHOKHARIYA on 2024-02-23.
//

import SwiftUI

struct GalleryView: View {
    
   //let gridLayout: [GridItem] = [
   //    GridItem(.flexible()),
   //    GridItem(.flexible()),
   //    GridItem(.flexible())
   //]
    
    @State private var selectedAnimal: String = "lion"
    
    // Efficient Grid Defination
//    let gridLayout : [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridcolumn: Double = 3.0
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridcolumn))
    }
    
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            // MARK: - GRID
            
            VStack (alignment: .center, spacing: 30){

                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth:8))
                
                Slider(value: $gridcolumn, in: 2...4, step:1)
                    .padding(.horizontal)
                    .onChange(of: gridcolumn, perform:{value in
                        gridSwitch()
                    })
                    
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10){
                    ForEach(animals){ item in
                       
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                                haptics.impactOccurred()
                            }
                    }
                }
                .animation(.easeIn)
                .onAppear(perform: {
                    gridSwitch()
                })
            }// VSTACK
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
    
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

#Preview {
    GalleryView()
}
