//
//  OrganizationPage.swift
//  AvenIosChallenge2.0
//
//  Created by Brandon Anzalone on 2/1/22.
//
import SwiftUI

struct OrganizationPage: View {
    
    var organization: Organization
    
    
    var body: some View {
        VStack(spacing: 16) {
            Text(organization.name)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            URLImage(url: organization.avatar)
                .scaledToFit()
                .frame(width: 175.0)
                .cornerRadius(16)
                .padding()
            
            if (organization.description ?? "").isEmpty {
                Text(organization.description ?? "There is no description for this company.")
                    .font(.title)
                    .multilineTextAlignment(.center)
            }else {
                
                Text(organization.description!)
                    .font(.title)
                    .multilineTextAlignment(.center)
            }
            
            
            Spacer()
            
            Link(destination: URL(string: organization.gitHubUrl + organization.name)!) {
                
                VStack {
                    Image(systemName: "paperplane")
                        .font(.largeTitle)
                        .padding()
                    Text("Visit \(organization.name)")
                        .font(.subheadline)
                }
            }
        }//VSTACK
    }
    
}

struct OrganizationPage_Previews: PreviewProvider {
    static var previews: some View {
        OrganizationPage(organization: Organization(name: "errfree",avatar: "",description:"", url: "",id: 44,node_id: "", repos_url: "",events_url: "",hooks_url: "",issues_url: "", members_url: "",public_members_url: ""))
    }
}
