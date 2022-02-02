//
//  OrganizationModel.swift
//  AvenIosChallenge2.0
//
//  Created by Brandon Anzalone on 2/1/22.
//

import Foundation

struct Organization: Decodable {
    let name: String
    let avatar: String
    var description: String? = nil
    let url: String
    let id: Int
    let node_id: String
    let repos_url: String
    let events_url: String
    let hooks_url: String
    let issues_url: String
    let members_url: String
    let public_members_url: String
    var gitHubUrl = "https://github.com/"
    
    private enum CodingKeys: String, CodingKey {
        case name = "login"
        case avatar = "avatar_url"
        case description = "description"
        case url = "url"
        case id = "id"
        case node_id = "node_id"
        case repos_url = "repos_url"
        case events_url = "events_url"
        case hooks_url = "hooks_url"
        case issues_url = "issues_url"
        case members_url = "members_url"
        case public_members_url = "public_members_url"
    }
}
