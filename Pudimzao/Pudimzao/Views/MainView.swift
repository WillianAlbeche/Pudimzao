//
//  Home.swift
//  Pudimzao
//
//  Created by Luiz Eduardo Mello dos Reis on 30/11/21.
//

import SwiftUI

let numberOfSamples: Int = 10
struct MainView: View {
    @State var screen = 1
    
    var body: some View {
        
        switch screen{
        case 1:
            PudimAsk(screen: $screen)
        case 2:
            PudimLoading(screen: $screen)
                .transition(.scale)
        case 3:
            PudimTipos(screen: $screen)
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
                .fill(LinearGradient(gradient: Gradient(colors: [Color("TitleColor1"), Color("TitleColor2")]),
                                     startPoint: .top,
                                     endPoint: .bottom))
                .frame(width: (UIScreen.main.bounds.width - CGFloat(numberOfSamples) * 10) / CGFloat(numberOfSamples), height: value)
        }
    }
}


struct PudimAsk: View {
    @Binding var screen: Int
    @ObservedObject private var mic = MicrophoneMonitor(numberOfSamples: numberOfSamples)
    
    private func normalizeSoundLevel(level: Float) -> CGFloat {
        let level = max(0.1, CGFloat(level) + 7) / 2 // between 0.1 and 25
        
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
                Button("Clique"){
                    screen = 2
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
    @Binding var screen: Int
    var body: some View {
        Text("PudimTipos")
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
    var body: some View {
        VStack{
            Text("voce é o pudim do(a) \(getPudimType())")
                .foregroundColor(.white)
            RingView()
        }
    }
}

// Custom View
struct GradientText: View {
    @State var text: String
    @State var gradient:LinearGradient = LinearGradient(
        gradient: Gradient(colors: [Color("TitleColor1"), Color("TitleColor2")]),
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
