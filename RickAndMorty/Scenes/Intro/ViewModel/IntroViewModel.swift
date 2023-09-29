//
//  IntroViewModel.swift
//  RickAndMorty
//
//  Created by Raul Quispe  on 28/09/23.
//

import Foundation
import Combine

final class IntroViewModel: ObservableObject {
    let background: String = AssetsIntro.background.name
    let logoIntro: String = AssetsIntro.logo.name
    let titleButton: String = IntroLocalizable.Title.Button.normal
    let messageText: String = IntroLocalizable.Message.Text.normal

    let idEnterButton: String = "enterButton"
    let idMessageText: String = "messageText"
}
