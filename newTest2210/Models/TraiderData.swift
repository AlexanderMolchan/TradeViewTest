//
//  TraiderData.swift
//  newTest2210
//
//  Created by Александр Молчан on 22.10.23.
//

import UIKit

final class TraiderData {
    func getTraiderData() -> [TraiderModel] {
        let one = TraiderModel(name: "Oliver", country: UIImage(named: "first") ?? UIImage(), deposit: 2367, profit: 336755)
        let two = TraiderModel(name: "Jack", country: UIImage(named: "second") ?? UIImage(), deposit: 1175, profit: 148777)
        let three = TraiderModel(name: "Harry", country: UIImage(named: "third") ?? UIImage(), deposit: 1100, profit: 113800)
        let four = TraiderModel(name: "Jacob", country: UIImage(named: "four") ?? UIImage(), deposit: 1000, profit: 36700)
        let five = TraiderModel(name: "Charley", country: UIImage(named: "five") ?? UIImage(), deposit: 999, profit: 33000)
        let six = TraiderModel(name: "Thomas", country: UIImage(named: "six") ?? UIImage(), deposit: 888, profit: 25800)
        let seven = TraiderModel(name: "George", country: UIImage(named: "seven") ?? UIImage(), deposit: 777, profit: 22300)
        let eight = TraiderModel(name: "Oscar", country: UIImage(named: "eight") ?? UIImage(), deposit: 666, profit: 17890)
        let nine = TraiderModel(name: "James", country: UIImage(named: "nine") ?? UIImage(), deposit: 555, profit: 13290)
        let ten = TraiderModel(name: "William", country: UIImage(named: "ten") ?? UIImage(), deposit: 444, profit: 9870)
        
        let array = [one, two, three, four, five, six, seven, eight, nine, ten]
        return array
    }
}
