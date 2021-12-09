//
//  ResultView.swift
//  Pudimzao
//
//  Created by Willian Magnum Albeche on 09/12/21.
//

import SwiftUI

struct ResultView: View {
    let pudimArray: [String : String] = [
        "Pudim feliz"       : "Pudinzao-Feliz-2 1",
        "Pudim doidão"      : "Pudinzao-Doidão-2 1",
        "Pudim putaço"      : "Pudinzao-Putaço-2 1",
        "Pudim desconfiado" : "Pudinzao-Desconfiado-2 1",
        "Pudim triste"      : "Pudinzao-Triste-2 1",
        "Pudim vampiro"     : "Pudinzao-Vampiro-2 1",
    ]
    
    @State private var pudimType:String = ""
    @State private var pudimImage: String = ""
    var valueRandom = Int.random(in: 1..<6)
    
    var body: some View {
        VStack(alignment: .center) {
            VStack {
                Text("Você é um")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Text(pudimType)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.996078431372549, green: 0.8705882352941177, blue: 0.5294117647058824))
                    .multilineTextAlignment(.center)
            }.shadow(color: Color(#colorLiteral(red: 0.4941176471, green: 0.2117647059, blue: 0.1254901961, alpha: 1)), radius:100)
            
            VStack(alignment: .center) {
                Image(pudimImage)
                    .resizable()
                    .frame(width: 400, height: 250, alignment: .center)
                //.offset(x: UIScreen.main.bounds.width * 5)
            }
        }.onAppear(){
            self.pudimLotery()
        }
    }
    
    
    func pudimLotery(){
        switch valueRandom {
        case 1:
            pudimType = "Pudim feliz"
            pudimImage = pudimArray["Pudim feliz"] ?? "xmark.octagon.fill"
        case 2:
            pudimType = "Pudim doidão"
            pudimImage = pudimArray["Pudim doidão"] ?? "xmark.octagon.fill"
        case 3:
            pudimType = "Pudim putaço"
            pudimImage = pudimArray["Pudim putaço"] ?? "xmark.octagon.fill"
        case 4:
            pudimType = "Pudim desconfiado"
            pudimImage = pudimArray["Pudim desconfiado"] ?? "xmark.octagon.fill"
        case 5:
            pudimType = "Pudim triste"
            pudimImage = pudimArray["Pudim triste"] ?? "xmark.octagon.fill"
        case 6:
            pudimType = "Pudim vampiro"
            pudimImage = pudimArray["Pudim vampiro"] ?? "xmark.octagon.fill"
        default:
            pudimType = "que não existe"
            pudimImage = "xmark.octagon.fill"
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}

struct ResultView2: View{
    var body: some View{
        Text("Pudins não gritam")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(Color(red: 0.996078431372549, green: 0.8705882352941177, blue: 0.5294117647058824))
            .multilineTextAlignment(.center)
    }
}
