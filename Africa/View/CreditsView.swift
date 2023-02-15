//
//  CreditsView.swift
//  Africa
//
//  Created by Arthur on 11/02/2023.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
            
            Text("""
    Copyright © Robert Petras
    All right reserved
    Better Apps ♡ Less Code
    """)
            .font(.footnote)
        .multilineTextAlignment(.center)
        }//: VStack
        .padding()
        .opacity(0.4)
    }//: body
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
