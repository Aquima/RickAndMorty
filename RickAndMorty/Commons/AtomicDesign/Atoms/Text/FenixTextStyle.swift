//
//  FenixTextStyle.swift
//  RickAndMorty
//
//  Created by Raul Quispe  on 25/09/23.
//

import SwiftUI

extension View {
    var fenixTextStyled: some View {
        self.font(.custom("Helvetica-Regular", size: 14))
            .foregroundColor(.black)
    }
}
