//
//  RingView.swift
//  Pudimzao
//
//  Created by Willian Magnum Albeche on 30/11/21.
//

import SwiftUI

struct RingView: View {
    @State private var showingAlert = false
    var percent: CGFloat = 0
    var body: some View {
        
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
                        .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9942818284, green: 0, blue: 0.5605643392, alpha: 1)), Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))]), startPoint: .topTrailing, endPoint: .bottomLeading))
                ).animation(.spring(response: 1.0, dampingFraction: 1, blendDuration: 10))
            Text("pudimzando voce ").font(.system(size: 20))
            
            if percent == 100 {
                Button("Show Alert") {
                    showingAlert = true
                }
                .alert("Voce foi pudimzado", isPresented: $showingAlert) {
                    Button("OK", role: .cancel) { }
                }
            }
        }
        
        
        
        
        
        //                .rotationEffect(Angle(degrees: 90))
        //                .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
        //.frame(width: 120, height: 120)
        //.animation(.spring(response: 1.0, dampingFraction: 1, blendDuration: 1))
        
    }
    
    
    
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView()
    }
}
