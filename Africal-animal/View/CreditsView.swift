//
//  CreditsView.swift
//  Africal-animal
//
//  Created by SMIT KHOKHARIYA on 2024-03-05.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        HStack {
            Spacer()
            VStack {
                
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width:128, height: 128)
                Text(
                """
                Copytight @ Robert Petras
                All right reserved
                Better Apps Less Code
                """)
                .font(.footnote)
                .multilineTextAlignment(.center)
                
            }//: VSTACK
            .padding()
            .opacity(0.4)
            Spacer()
        }
    }
}

#Preview {
    CreditsView()
        .previewLayout(.sizeThatFits)
        .padding()
}
