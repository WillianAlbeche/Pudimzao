//
//  Home.swift
//  Pudimzao
//
//  Created by Luiz Eduardo Mello dos Reis on 30/11/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        Text("voce é o pudim do(a) \(getPudimType())")
            .foregroundColor(.white)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
