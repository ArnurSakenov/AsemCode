//
//  NamingOptionsEntity.swift
//  OnayCode
//
//  Created by Arnur Sakenov on 07.03.2023.
//

import Foundation

struct NamingOptions {
    let optionText: String
    let isCorrect: Bool
}

let namingOptions = [
    NamingOptions(optionText: "Person", isCorrect: true),
    NamingOptions(optionText: "Animal", isCorrect: false),
    NamingOptions(optionText: "person", isCorrect: false),
    NamingOptions(optionText: "Persons", isCorrect: false),
]

