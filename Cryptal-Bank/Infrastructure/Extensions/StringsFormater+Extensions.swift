//
//  StringsFormater+Extensions.swift
//  Cryptal-Bank
//
//  Created by MacBook Pro on 04.01.22.
//

import Foundation



extension String {
    func moneyFormat() -> String{
        var newString = ""
        var dotIndex = 10000
        
        Array(self).reversed().enumerated().forEach{ index, char  in
            
            if (dotIndex - index + 1 ) % 3 == 0  && dotIndex + 1 < index  {
                newString += " "
            }
            
            if char == "." {
                dotIndex = index
            }
            
            newString += "\(char)"
        }
        return  String(newString.reversed())
    }
}
