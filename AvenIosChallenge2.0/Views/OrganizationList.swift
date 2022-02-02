//
//  OrganizationList.swift
//  AvenIosChallenge2.0
//
//  Created by Brandon Anzalone on 2/1/22.
//


import SwiftUI

struct OrganizationList: View {
    
    var organization: Organization
    
    var body: some View {
        HStack {
            URLImage(url:organization.avatar)
                .scaledToFit()
                .frame(width: 50.0)
                .cornerRadius(16)
                .padding(.horizontal)
            VStack(alignment: .leading){
                Text(organization.name)
                    .font(.headline)
                    .fontWeight(.heavy)
            
            }//VSTACK
        }//HSTACK
    }
}

struct OrganizationList_Previews: PreviewProvider {
    static var previews: some View {
        OrganizationList(organization: Organization(name: "errfree",avatar: "",description:"", url: "",id: 44,node_id: "", repos_url: "",events_url: "",hooks_url: "",issues_url: "", members_url: "",public_members_url: ""))
    }
}
