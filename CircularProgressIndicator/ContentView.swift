//
//  ContentView.swift
//  CircularProgressIndicator
//
//  Created by Ramill Ibragimov on 21.05.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var progress: Double = 0.0
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 50)
                .opacity(0.3)
                .foregroundColor(Color.green)
                .padding()
            
            Text(String(format: "%.0f%%", min(self.progress, 1) * 100))
                .font(.system(size: 50))
            
            Circle()
                .trim(from: 0.0, to: CGFloat(self.progress))
                .stroke(style: StrokeStyle(lineWidth: 50, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.green)
                .animation(Animation.linear(duration: 2.0))
                .padding()
            
            Button("Get Data") {
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                    if self.progress >= 1 {
                        self.progress = 0.0
                    }
                    self.progress += 0.1
                    if self.progress >= 1 {
                        timer.invalidate()
                    }
                }
            }.offset(y: 300)
            
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
