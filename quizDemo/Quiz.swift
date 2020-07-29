//
//  Quiz.swift
//  quizDemo
//
//  Created by 陳家豪 on 2020/7/29.
//

import Foundation
struct Quiz:Equatable{
    static func == (lhs: Quiz, rhs: Quiz) -> Bool {
        return lhs.quizNumber == rhs.quizNumber
    }
    let quizNumber:Int
    let question:String
    let options:[Option]
}
struct Option{
    let content:String
    let belongTo:House
}
enum House{
    case Hufflepuff
    case Gryffindor
    case Ravenclaw
    case Slytherin
}

