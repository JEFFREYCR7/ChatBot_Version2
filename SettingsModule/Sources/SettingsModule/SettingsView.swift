//
//  File.swift
//  
//
//  Created by 王杰瑞 on 2024/8/5.
//

import Foundation
import SwiftUI

public struct SettingsView: View {
    public init() {}
    
    public var body: some View {
        VStack {
            TabView {
                GeneralView()
                    .tabItem {
                        Label("General", systemImage: "gearshape.circle")
                    }
            }
        }
        .padding()
        .frame(width: 450)
    }
}

#Preview {
    SettingsView()
}
