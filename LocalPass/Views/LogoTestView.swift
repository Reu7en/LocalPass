//
//  LogoTestView.swift
//  LocalPass
//
//  Created by Reuben on 17/08/2024.
//

import SwiftUI

struct LogoTestView: View {
    var body: some View {
        GeometryReader { geometry in
            let logoBackgroundSize = CGSize(width: geometry.size.width * 0.9, height: geometry.size.width * 0.9)
            let logoForegroundSize = CGSize(width: logoBackgroundSize.width * 0.8, height: logoBackgroundSize.height * 0.8)
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    ZStack {
                        // Background
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 40)
                                .foregroundStyle(AngularGradient(gradient: Gradient(colors: [.blue, .green, .purple, .teal, .blue]), center: .center))
                        }
                        .frame(width: logoBackgroundSize.width, height: logoBackgroundSize.height)

                        // Foreground
                        
                        ZStack {
                            Image(systemName: "key.horizontal.fill")
                                .resizable()
                                .scaledToFit()
                                .symbolRenderingMode(.monochrome)
                                .foregroundStyle(Color(red: 225 / 255, green: 225 / 255, blue: 225 / 255))
                                .rotation3DEffect(.degrees(180), axis: (x: 0.0, y: 1.0, z: 0.0))
                                .shadow(color: .gray, radius: 10)
                            
                            Image(systemName: "rectangle.and.pencil.and.ellipsis")
                                .resizable()
                                .scaledToFit()
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255), .indigo)
                                .shadow(color: .gray, radius: 10)
                                .scaleEffect(0.4)
                                .offset(x: logoForegroundSize.width / 3, y: logoForegroundSize.height / 4)
                        }
                        .frame(width: logoForegroundSize.width, height: logoForegroundSize.height)
                    }
                    
                    Spacer()
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    LogoTestView()
}
