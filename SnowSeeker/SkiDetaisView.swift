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
        VStack {
            Text("Elevation: \(resort.elevation)m")
            Text("Snow: \(resort.snowDepth)cm")
        }
         
    }
}

struct SkiDetaisView_Previews: PreviewProvider {
    static var previews: some View {
        SkiDetaisView(resort: Resort.example)
    }
}
