//
//  TunnelTab.swift
//  SakuraLauncher
//
//  Created by FENGberd on 6/3/21.
//

import SwiftUI

struct TunnelTab: View {
    var body: some View {
        VStack (alignment: .leading) {
            Text("隧道")
                .font(.title)
                .padding(.leading, 24)
            
            ScrollView {
                
            }
        }
    }
}

#if DEBUG
struct TunnelTab_Previews: PreviewProvider {
    static var previews: some View {
        TunnelTab()
    }
}
#endif