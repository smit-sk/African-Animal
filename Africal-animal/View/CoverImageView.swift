//
//  CoverImageView.swift
//  Africal-animal
//
//  Created by SMIT KHOKHARIYA on 2024-02-25.
//

import SwiftUI

struct CoverImageView: View {
    let coverImages : [CoverImage] =
        Bundle.main.decode("covers.json")
        
    var body: some View {
        TabView{
            ForEach(coverImages){ item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }//: LOOP
        }// :  TAB
        .tabViewStyle(PageTabViewStyle())
    }
}

#Preview {
    CoverImageView()
        .previewLayout(.fixed(width: 400, height: 300))
}
