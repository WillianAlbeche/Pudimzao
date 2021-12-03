//
//  PudimzaoApp.swift
//  Pudimzao
//
//  Created by Willian Magnum Albeche on 29/11/21.
//

import SwiftUI

@main
struct PudimzaoApp: App {
    let bgcolor = Color("Background")
    var body: some Scene {
        WindowGroup {
            ZStack{
                bgcolor
                    .edgesIgnoringSafeArea(.all)
                MainView()
            }
        }
    }
}
