//
//  FenixTextStyle.swift
//  RickAndMorty
//
//  Created by Raul Quispe  on 25/09/23.
//

import SwiftUI

extension View {

    var fenixMessageTextStyled: some View {
        self.font(.custom("Helvetica-Regular", size: 14))
            .foregroundColor(FenixColor.messageTextColor.swiftUIColor)
    }
    func fenixTextStyled(_ status: Status) -> some View {
        self.font(.custom("Helvetica-Bold", size: 17)).foregroundColor(getColor(status))
    }

    private func getColor(_ status: Status) -> Color {
        switch status {
        case .dead:
            return .red
        case .alive:
            return .green
        case .unknown:
            return .yellow
        }
    }
    var fenixTitleCharacterTextStyled: some View {
        self.font(.custom("GetSchwifty-Regular", size: 20))
            .foregroundColor(FenixColor.characterTitleColor.swiftUIColor)
    }
}
