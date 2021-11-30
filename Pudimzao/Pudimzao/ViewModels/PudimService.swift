//
//  PudimService.swift
//  Pudimzao
//
//  Created by Luiz Eduardo Mello dos Reis on 30/11/21.
//

import Foundation


func getPudimType() -> String{
    if let pudim = PudimTypes().pudimArray.randomElement() {
        return "\(pudim)"
    }
    return "Pudim padrao"
}
