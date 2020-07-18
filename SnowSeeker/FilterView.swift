//
//  FilterView.swift
//  SnowSeeker
//
//  Created by slava bily on 16/7/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import SwiftUI

struct FilterView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var resorts: Resorts
     
    let filters = ["Default", "Country", "Size", "Price"]
    
    @State private var filterSelection = 0
    @State private var filterValue = ""
    
    var filterType: String {
        switch filterSelection {
        case 0:
            return filters[0]
        case 1:
            return filters[1]
        case 2:
            return filters[2]
        case 3:
            return filters[3]
        default:
            break
        }
        return filters[0]
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Select the type of filter").font(.headline)) {
                    Picker(selection: $filterSelection, label: Text("")) {
                        ForEach(0..<filters.count) {
                            Text(self.filters[$0])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Please enter \(filterType)")) {
                    TextField(filterType, text: $filterValue) {
                        switch self.filterType {
                        case "Default":
                            self.resorts.resorts = Resorts.init().resorts
                        case "Country":
                            self.resorts.resorts = self.resorts.filteredByCountry(self.filterValue)
                        case "Size":
                            self.resorts.resorts = self.resorts.filteredBySize(self.filterValue)
                        case "Price":
                            self.resorts.resorts = self.resorts.filteredByPrice(self.filterValue)
                        default:
                            break
                        }
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .navigationBarTitle("Filter")
            .onAppear {
                self.resorts.resorts = Resorts.init().resorts
            }
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(resorts: Resorts())
    }
}
