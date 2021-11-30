//
//  RingView.swift
//  Pudimzao
//
//  Created by Willian Magnum Albeche on 30/11/21.
//

import SwiftUI

struct RingView: View {
    var body: some View {
        Circle()
                .trim(from: 0.2, to: 1)
                .stroke(
                        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))]), startPoint: .topTrailing, endPoint: .bottomLeading),
                        style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20, 0], dashPhase: 0)
                )
                .frame(width: 44, height: 44)    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView()
    }
}
