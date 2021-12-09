//
//  RingView.swift
//  Pudimzao
//
//  Created by Willian Magnum Albeche on 30/11/21.
//

import SwiftUI

struct RingView: View {
    private var loadingPhrases: [String] = [
        "Pudimzando seu grito...",
        "Pudimzando você...",
        "Rindo do seu grito...",
        "Pudimzando sua familia...",
        "Pudimzando isso...",
        "Compartilhando seu grito com terceiros..."
        
    ]
    var valor = Int.random(in: 1..<6)
    @State private var loadingPhraseIndex: String = "Pudimzando seu grito..."
    @State var nIndex = 0
    @State var percent: CGFloat = 0
    @State private var showingAlert = false
    var body: some View {
        
        VStack {
            ZStack {
                Circle()
                    .fill(Color("Background"))
                    .frame(width: 260, height: 260)
                    .overlay(
                        Circle()
                            .trim(from: 0, to: percent)
                            .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin:.round))
                            .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 0.7843137255, blue: 0.01568627451, alpha: 1)), Color(#colorLiteral(red: 0.9960784314, green: 0.8705882353, blue: 0.5294117647, alpha: 1)), Color(#colorLiteral(red: 0.4941176471, green: 0.2117647059, blue: 0.1254901961, alpha: 1))]), startPoint: .bottomLeading , endPoint: .topTrailing))
                            .shadow(color: Color(#colorLiteral(red: 0.4941176471, green: 0.2117647059, blue: 0.1254901961, alpha: 1)), radius:100)
                    )
                
                Text(loadingPhraseIndex)
                    .font(.system(size: 20))
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .frame(width: 250, height: 100)
            }
            
            HStack{
                
                Button{
                    print(self.percent)
                    
                } label: {
                    Text("Finish")
                }
            }
            
        }.onAppear(){
            self.startLoading()
            self.randomPhrases()
        }
        
    }
    func startLoading() {
        _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            withAnimation() {
                switch self.valor {
                case 1:
                    self.percent += 0.01
                    print(valor)
                case 2:
                    self.percent += 0.01
                    print(valor)
                case 3:
                    self.percent += 0.01
                    print(valor)
                case 4:
                    self.percent += 0.01
                    print(valor)
                case 5:
                    self.percent += 0.001
                    print(valor)
                default:
                    self.percent += 0.01
                    print(valor)
                    
                }                //self.percent += 0.001
                if self.percent >= 1 {
                    timer.invalidate()
                }
            }
        }
    }
    
    
    func randomPhrases(){
        _ = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) { timer in
            self.nIndex += 1
            self.nIndex = self.nIndex >= loadingPhrases.count ? 0 : self.nIndex
            if self.percent >= 1 {
                timer.invalidate()
            }
            self.loadingPhraseIndex = self.loadingPhrases[self.nIndex]
        }
        
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView()
    }
}
