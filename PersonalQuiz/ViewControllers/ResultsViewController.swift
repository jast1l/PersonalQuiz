//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 05.04.2021.
//

// Homework assignment
// 1. Передать сюда массив с ответами
// 2. Определить наиболее часто встречающийся тип животного
// 3. Отобразить результат в соответсвии с этим животным
// 4. Избавиться от кнопки возврата назад на экране результатов

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var areYouLabel: UILabel!
    @IBOutlet weak var explanationLabel: UILabel!
    
    var results: [Answer]!
    var finalSelection: AnimalType? {
        checkingResult()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        areYouLabel.text = "Вы - \(finalSelection?.rawValue ?? "⁉️")"
        explanationLabel.text = finalSelection?.definition
        
        navigationItem.hidesBackButton = true
    }
}

extension ResultsViewController {

    private func checkingResult() -> AnimalType? {
        var selectionCounters = [AnimalType: Int]()
        var selection: AnimalType?
        
        if let answers = results {
            for animal in answers {
                if selectionCounters.keys.contains(animal.type) {
                    selectionCounters[animal.type]! += 1
                } else {
                    selectionCounters[animal.type] = 1
                }
            }
            
            for (key, value) in selectionCounters {
                if value > 1 {
                    selection = key
                }
            }
        }
        return selection
    }
}
