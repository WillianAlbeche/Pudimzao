//
//  RingView.swift
//  Pudimzao
//
//  Created by Willian Magnum Albeche on 30/11/21.
//

import SwiftUI

struct RingView: View {
    @State var percent: CGFloat = 0
    @State private var showingAlert = false
    var body: some View {
        
        VStack {
            ZStack {
                
                Circle()
                    .foregroundColor(Color(#colorLiteral(red: 0.1892106831, green: 0.1867186129, blue: 0.2563015223, alpha: 1)))
               
                    .overlay(
                        Circle()
                            .trim(from: 0, to: 1)
                            .stroke(style: StrokeStyle(lineWidth: 50, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20, 0], dashPhase: 0)
                                   )
                        
                            .stroke(style: StrokeStyle(lineWidth: 30, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20, 0], dashPhase: 0)
                                   )
                    )
                    .opacity(0.20)
                    .frame(width: 190, height: 190)
                
                
                Circle()
                    .fill(Color.white)
                    .frame(width: 260, height: 260)
                    .overlay(
                        Circle()
                            .trim(from: 0, to: percent * 0.01)
                            .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20, 0], dashPhase: 0)
                                   )
                            .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9942818284, green: 0, blue: 0.5605643392, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.8352941176, blue: 0.6235294118, alpha: 1))]), startPoint: .topTrailing, endPoint: .bottomLeading))
                    ).animation(.spring(response: 1.0, dampingFraction: 1, blendDuration: 10))
                Text("pudimzando voce ").font(.system(size: 20))
                
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

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView()
    }
}
