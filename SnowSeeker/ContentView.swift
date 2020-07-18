//
//  ContentView.swift
//  SnowSeeker
//
//  Created by slava bily on 10/7/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import SwiftUI

extension View {
    func phoneOnlyStackNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return AnyView(self.navigationViewStyle(StackNavigationViewStyle()))
        } else {
            return AnyView(self)
        }
    }
}
 
struct ContentView: View {
    
    @ObservedObject var favorites = Favorites()
    @ObservedObject var resorts = Resorts()
    
    @State private var showingSortActionSheet = false
    @State private var showingFilterSheet = false
    @State private var sorter: SortType = .none
    
    enum SortType {
        case none, alphabetical, country
    }
    
    var sortedResorts: [Resort] {
        switch sorter {
        case .none:
            return resorts.resorts
        case .alphabetical:
            return resorts.resorts.sorted {
                $0.name < $1.name
            }
        case .country:
            return resorts.resorts.sorted {
                $0.country < $1.country
            }
        }
    }
 
    var body: some View {
        NavigationView {
            List(sortedResorts) { resort in
                NavigationLink(destination: ResortView(resort: resort)) {
                    Image(resort.country)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 25)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .overlay(RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    
                    VStack(alignment: .leading) {
                        Text(resort.name)
                            .font(.headline)
                        Text("\(resort.runs) runs")
                            .foregroundColor(.secondary)
                    }
                    .layoutPriority(1)
                    
                    if self.favorites.contains(resort) {
                        Spacer()
                        Image(systemName: "heart.fill")
                        .accessibility(label: Text("This is a favorite resort"))
                            .foregroundColor(.red)
                    }
                }
            }
            .navigationBarTitle("Resorts")
            .navigationBarItems(leading: Button(action: {
                self.showingSortActionSheet = true
            }, label: {
                Text("Sort")
            }), trailing: Button(action: {
                self.showingFilterSheet = true
            }, label: {
                Text("Filter")
            }))
                .actionSheet(isPresented: $showingSortActionSheet) {
                    ActionSheet(title: Text("Sorting"), message: nil, buttons: [.default(Text("Default"), action: {
                        self.sorter = .none
                    }),.default(Text("Alphabetical"), action: {
                        self.sorter = .alphabetical
                    }),.default(Text("Country"), action: {
                        self.sorter = .country
                    })])
            }
            .sheet(isPresented: $showingFilterSheet) {
                FilterView(resorts: self.resorts)
            }
                      
            WelcomeView()
        }
        .environmentObject(favorites)
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
