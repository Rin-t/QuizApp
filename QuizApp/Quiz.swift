//
//  Quiz.swift
//  QuizApp
//
//  Created by Rin on 2024/07/06.
//

import Foundation

struct Quiz {
    let question: String
    let choices: [String]
    private let answerIndex: Int
    
    func isCorrect(selectedAnswer: String) -> Bool {
        return choices[answerIndex] == selectedAnswer
    }
    
    static let quizes: [Self] = [
        Quiz(
            question: "行脚",
            choices: ["あんきゃ", "こうきゃ", "あんぎゃ", "こうぎゃ"],
            answerIndex: 2
        ),
        Quiz(
            question: "如実",
            choices: ["にょじつ", "じょじつ", "にょしつ", "じょしつ"],
            answerIndex: 0
        ),
        Quiz(
            question: "英邁",
            choices: ["えいまい", "えいび", "えいむ", "えいべい"],
            answerIndex: 0
        ),
        Quiz(
            question: "喬木",
            choices: ["きょうぼく", "きょうもく", "きょうぎ", "きょうれい"],
            answerIndex: 0
        ),
        Quiz(
            question: "汎用",
            choices: ["へんよう", "ばんよう", "はんよう", "ほうよう"],
            answerIndex: 2
        ),
        Quiz(
            question: "斬新",
            choices: ["ざんしん", "せんしん", "しんせん", "しんざん"],
            answerIndex: 0
        ),
        Quiz(
            question: "勃興",
            choices: ["ぼっこう", "ほっこう", "ぼつこう", "ほつこう"],
            answerIndex: 0
        ),
        Quiz(
            question: "頓挫",
            choices: ["とんさ", "とんざ", "たんさ", "たんざ"],
            answerIndex: 1
        ),
        Quiz(
            question: "驚愕",
            choices: ["きょうがく", "きょうかく", "けいがく", "けいかく"],
            answerIndex: 0
        ),
        Quiz(
            question: "燦爛",
            choices: ["ざんらん", "さんらん", "ざんれん", "さんれん"],
            answerIndex: 1
        )
    ]
}
