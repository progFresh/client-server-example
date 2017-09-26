//
//  Robot.swift
//  Robots
//
//  Created by Сергей Полозов on 26.09.17.
//  Copyright © 2017 sergey. All rights reserved.
//

import Foundation

struct Robot {

    // MARK: Properties

    let about: String
    let address: String
    let company: String
    let email: String
    let firstName: String
    let id: Int
    let lastName: String
    let phone: String
    let photo: String

    // MARK: Initialization

    init(
        about: String,
        address: String,
        company: String,
        email: String,
        firstName: String,
        id: Int,
        lastName: String,
        phone: String,
        photo: String
        ) {
        self.about = about
        self.address = address
        self.company = company
        self.email = email
        self.firstName = firstName
        self.id = id
        self.lastName = lastName
        self.phone = phone
        self.photo = photo
    }

    init(modelDictionary: ModelDictionary) throws {
        let about: String = try modelDictionary.field(for: .about)
        let address: String = try modelDictionary.field(for: .address)
        let company: String = try modelDictionary.field(for: .company)
        let email: String = try modelDictionary.field(for: .email)
        let firstName: String = try modelDictionary.field(for: .first_name)
        let id: Int = try modelDictionary.field(for: .id)
        let lastName: String = try modelDictionary.field(for: .last_name)
        let phone: String = try modelDictionary.field(for: .phone)
        let photo: String = try modelDictionary.field(for: .photo)
        self.init(
            about: about,
            address: address,
            company: company,
            email: email,
            firstName: firstName,
            id: id,
            lastName: lastName,
            phone: phone,
            photo: photo
        )
    }
}
