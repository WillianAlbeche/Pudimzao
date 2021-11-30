//
//  ContentView.swift
//  Pudimzao
//
//  Created by Willian Magnum Albeche on 29/11/21.
//

import SwiftUI

struct ContentView: View {
    @State var percent: CGFloat = 0
   
    
    var body: some View {
        VStack {
            
                    
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
