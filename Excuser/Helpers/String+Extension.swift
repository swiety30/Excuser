//
//  String+Extension.swift
//  Excuser
//
//  Created by Paweł Świątek on 25/10/2022.
//

import Foundation

extension String {
    func firstLetterCapitalised() -> String {
        self.prefix(1).capitalized + dropFirst()
    }
}
