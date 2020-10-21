//
//  MyDataProvider.swift
//  Widget_ExExtension
//
//  Created by Mikhail Kolkov  on 23.09.2020.
//

import Foundation


class DataProvider {
    static func getRandomString() -> String {
        let strings = [
            "one",
            "two",
            "three",
            "four",
            "five",
            "six",
            "seven",
            "eight",
            "nine",
            "ten",
        
        ]
        
        return strings.randomElement()!
    }
}
