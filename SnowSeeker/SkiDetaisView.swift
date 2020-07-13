//
//  SkiDetaisView.swift
//  SnowSeeker
//
//  Created by slava bily on 12/7/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import SwiftUI

struct SkiDetaisView: View {
    let resort: Resort
    
    var body: some View {
        Group {
            Text("Elevation: \(resort.elevation)m").layoutPriority(1)
            Spacer().frame(height: 0)
            Text("Snow: \(resort.snowDepth)cm").layoutPriority(1)
        }
         
    }
}

struct SkiDetaisView_Previews: PreviewProvider {
    static var previews: some View {
        SkiDetaisView(resort: Resort.example)
    }
}
