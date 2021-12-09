//
//  Home.swift
//  Pudimzao
//
//  Created by Luiz Eduardo Mello dos Reis on 30/11/21.
//

import SwiftUI

let numberOfSamples: Int = 10
struct MainView: View {
    @State var screen = 2
    
    var body: some View {
        
        switch screen{
        case 1:
            PudimAsk(screen: $screen)
        case 2:
            PudimLoading(screen: $screen)
        case 3:
            Text("ola")
            //PudimTipos(screen: $screen , valorTela: $valorTela)
        case 4:
            PudimScream(screen: $screen)
            
        default:
            PudimAsk(screen: $screen)
        }
    }
}

struct BarView: View {
    var value: CGFloat
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 0.7843137255, blue: 0.01568627451, alpha: 1)), Color(#colorLiteral(red: 0.9960784314, green: 0.8705882353, blue: 0.5294117647, alpha: 1)), Color(#colorLiteral(red: 0.4941176471, green: 0.2117647059, blue: 0.1254901961, alpha: 1))]), startPoint: .bottomLeading , endPoint: .topTrailing))
                .frame(width: (UIScreen.main.bounds.width - CGFloat(numberOfSamples) * 10) / CGFloat(numberOfSamples), height: value)
        }
    }
}


struct PudimAsk: View {
    @Binding var screen: Int
    @ObservedObject private var mic = MicrophoneMonitor(numberOfSamples: numberOfSamples)
    
    private func normalizeSoundLevel(level: Float) -> CGFloat {
        let level = max(0.1, CGFloat(level) + 40) / 2 // between 0.1 and 25
        print(level)
        if(1 >= 0.01){
            screen = 2
        }

        return CGFloat(level * (300 / 25)) // scaled to max at 300 (our height of our bar)
    }
    
    
    var body: some View {
        ZStack{
            VStack{
                Text("Que tipo de pudim você é?")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                VStack{}.frame(height: UIScreen.main.bounds.height * 0.067)
                Group{
                    GradientText(text: "Grite,")
                        .font(.largeTitle)
                    GradientText(text: "bem alto")
                        .font(.title)
                }
            }
            HStack(spacing: 4) {
                ForEach(mic.soundSamples, id: \.self) { level in
                    BarView(value: self.normalizeSoundLevel(level: level))
                }
            }
        }
    }
}

struct PudimTipos: View {
    var valorTela: Int
    var body: some View {
        VStack{
            if valorTela == 5{
                ResultView2()
            }
            else{
                ResultView()
            }
            
        }
    }
}

struct PudimScream: View {
    @Binding var screen: Int

    var body: some View {
        Text("PudimScream")
    }
}

struct PudimLoading: View {
    @Binding var screen: Int
    @State var valorTela: Int = RingView().valor
    var body: some View {
        
        VStack{
//            Text("voce é o pudim do(a) \(getPudimType())")
            RingView()
            Text("\(RingView().valor)")
                .foregroundColor(Color.white)
            if RingView().percent == 1 {
                PudimTipos(valorTela: valorTela)
            }
            
        }
    }
}

// Custom View
struct GradientText: View {
    @State var text: String
    @State var gradient:LinearGradient = LinearGradient(
        gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 0.7843137255, blue: 0.01568627451, alpha: 1)), Color(#colorLiteral(red: 0.9960784314, green: 0.8705882353, blue: 0.5294117647, alpha: 1)), Color(#colorLiteral(red: 0.4941176471, green: 0.2117647059, blue: 0.1254901961, alpha: 1))]),
        startPoint: .top,
        endPoint: .bottom
    )
    
    var body: some View {
        Text(text)
            .fontWeight(.black)
            .foregroundColor(Color.clear)
            .background(gradient.mask(Text(self.text)))
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
