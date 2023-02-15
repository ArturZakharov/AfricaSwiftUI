//
//  CenterModifier.swift
//  Africa
//
//  Created by Arthur on 11/02/2023.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
