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
    var valor = Bool.random()
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
                            .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9942818284, green: 0, blue: 0.5605643392, alpha: 1)), Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))]), startPoint: .bottomLeading , endPoint: .topTrailing))
                    )
                
                Text(loadingPhraseIndex)
                    .font(.system(size: 20))
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .frame(width: 250, height: 100)
            }
            HStack{
                
                Button{
                    percent = 100
                    
                } label: {
                    Text("Finish")
                }
                
                Button{
                    self.startLoading()
                    self.randomPhrases()
                } label: {
                    Text("Start")
                }
            }
        }
        
    }
    func generationNumbers(){
        
    }
    func startLoading() {
        _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            withAnimation() {
                switch self.valor {
                case true:
                    self.percent += 0.01
                    print(valor)
                case false:
                    self.percent += 0.001
                    print(valor)
                }
                //self.percent += 0.001
                if self.percent >= 5 {
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
