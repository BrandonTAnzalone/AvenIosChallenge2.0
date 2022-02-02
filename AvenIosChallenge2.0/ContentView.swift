//
//  ContentView.swift
//  AvenIosChallenge2.0
//
//  Created by Brandon Anzalone on 2/1/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var listVM = ListViewModel()
    
    var body: some View {
        NavigationView{
            List {
                ForEach(listVM.organizations,id:\.name) {
                    organization in NavigationLink(destination: OrganizationPage(organization:organization)) {
                        OrganizationList(organization :organization)
                    }
                }
            }
            .navigationTitle("Organizations")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
