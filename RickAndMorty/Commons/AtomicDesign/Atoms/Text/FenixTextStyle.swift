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
            .foregroundColor(.white)
    }
    func fenixTextStyled(_ status: Status) -> some View {
        switch status {
        case .dead:
            self.font(.custom("Helvetica-Bold", size: 17))
                .foregroundColor(.red)
        case .alive:
            self.font(.custom("Helvetica-Bold", size: 17))
                .foregroundColor(.green)
        case .unknown:
            self.font(.custom("Helvetica-Bold", size: 17))
                .foregroundColor(.yellow)
        }
    }
    var fenixTitleCharacterTextStyled: some View {
        self.font(.custom("GetSchwifty-Regular", size: 20))
            .foregroundColor(.black)
    }
}
