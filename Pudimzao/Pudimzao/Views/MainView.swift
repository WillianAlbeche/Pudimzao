//
//  Home.swift
//  Pudimzao
//
//  Created by Luiz Eduardo Mello dos Reis on 30/11/21.
//

import SwiftUI

struct MainView: View {
    
    @State var percent: CGFloat = 0
    var body: some View {
<<<<<<< HEAD
        VStack{
        Text("voce é o pudim do(a) \(getPudimType())")
            .foregroundColor(.white)
        RingView()
=======
        VStack {
            Text("voce é o pudim do(a) \(getPudimType())")
                .foregroundColor(.white)
            RingView(percent: percent)
            
            HStack{
                Button{
                    percent = 100
                } label: {
                    Text("Finish")
                }
                
                Button{
                    self.startLoading()
                } label: {
                    Text("Start")
                }
            }
        }
    }
    
    
    func startLoading() {
        _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            withAnimation() {
                self.percent += 1
                if self.percent >= 100.0 {
                    timer.invalidate()
                }
            }
>>>>>>> c0d287dec62c6f025c7db66fa54407f8937634df
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
