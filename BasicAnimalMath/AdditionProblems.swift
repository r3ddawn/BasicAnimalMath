//
//  AdditionProblems.swift
//  BasicAnimalMath
//
//  Created by Eric Johnson on 3/4/23.
//

import Foundation

struct AdditionProblems {
    var difficulty: String = "Easy"
    
    private var problems: [[Int]] {
        var problemList = [[Int]]()
        
        for num in 1...getProblemLimit() {
            for num2 in 1...getProblemLimit() {
                problemList.append([num, num2, num + num2])
            }
        }
        return problemList
    }
    
    private func getProblemLimit() -> Int{
        switch difficulty {
            case "Very Easy":
                return 3
            case "Easy":
                return 6
            case "Medium":
                return 10
            case "Hard":
                return 20
            case "Very Hard":
                return 100
            default:
                return 10
        }
    }
    
    func getProblem(number: Int) -> String {
        "\(problems[number][0]) + \(problems[number][1])"
    }
    
    func getAnswer(number: Int) -> Int {
        problems[number][2]
    }
    
}
