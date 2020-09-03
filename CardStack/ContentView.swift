//  ContentView.swift
//  CardStack
//
//  Created by Stephen on 8/30/20.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        NavigationView {
            List {
                Text("hello")
            }.navigationBarTitle(Text("Cards"))
            .navigationBarItems(trailing:
                Button(action: {
                   print("Add Pressed")
                }) {
                    Image(systemName: "plus")
                }
            )
            
        }
    }
}

    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
