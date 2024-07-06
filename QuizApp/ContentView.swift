//
//  ContentView.swift
//  QuizApp
//
//  Created by Rin on 2024/07/06.
//

import SwiftUI
import Observation

struct ContentView: View {
    @State var viewModel = ViewModel()
    
    var body: some View {
        switch viewModel.viewType {
        case .finish:
            Text("おわり！")
                .font(.title)
                .padding(.bottom, 24)
            
            Text("10問中\(viewModel.correctCount)問正解でした！")
                .font(.title)
                .padding(.bottom, 24)
            
        case .select:
            VStack {
                Text("この漢字の読みはなんでしょう？")
                    .padding(.bottom, 24)
                
                Text(viewModel.currentQuiz.question)
                    .font(.title)
                    .padding(.bottom, 24)
                
                ChoicesView(firstChoice: viewModel.currentQuiz.choices[0],
                            secondChoice: viewModel.currentQuiz.choices[1],
                            thirdChoice: viewModel.currentQuiz.choices[2],
                            fourthChoice: viewModel.currentQuiz.choices[3]) { title in
                    viewModel.tappedAnswer(selectedAnswer: title)
                }
            }
        case .result(let isCorrect):
            VStack {
                if isCorrect {
                    Text("正解")
                        .font(.title)
                        .padding(.bottom, 24)
                } else {
                    Text("残念")
                        .font(.title)
                        .padding(.bottom, 24)
                }
                
                Button {
                    viewModel.tappedNextButton()
                } label: {
                    VStack {
                        Text("つぎへ")
                            .frame(width: 120)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 2)
                            )
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

struct ChoicesView: View {
    
    let firstChoice: String
    let secondChoice: String
    let thirdChoice: String
    let fourthChoice: String
    
    let action: (String) -> Void
    
    var body: some View {
        VStack {
            HStack {
                choiceButton(choiceText: firstChoice) {
                    action(firstChoice)
                }
                .padding(.trailing, 8)

                choiceButton(choiceText: secondChoice) {
                    action(secondChoice)
                }
            }
            .padding(.bottom, 8)
            
            HStack {
                choiceButton(choiceText: thirdChoice) {
                    action(thirdChoice)
                }
                .padding(.trailing, 8)
                
                choiceButton(choiceText: fourthChoice) {
                    action(fourthChoice)
                }
            }
        }
    }
    
    func choiceButton(choiceText: String, action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            VStack {
                Text(choiceText)
                    .frame(width: 120)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 2)
                    )
            }
        }
    }
}

@Observable
final class ViewModel {
    
    enum ViewType {
        case select
        case result(isCorrect: Bool)
        case finish
    }
    
    let quizes = Quiz.quizes
    var currentQuizIndex = 0
    var correctCount = 0
    
    var viewType: ViewType = .select
    
    var currentQuiz: Quiz {
        quizes[currentQuizIndex]
    }
    
    func tappedAnswer(selectedAnswer: String) {
        let isCorrect = currentQuiz.isCorrect(selectedAnswer: selectedAnswer)
        viewType = .result(isCorrect: isCorrect)
        if isCorrect {
            correctCount += 1
        }
    }
    
    func tappedNextButton() {
        if currentQuizIndex == 9 {
            viewType = .finish
        } else {
            currentQuizIndex += 1
            viewType = .select
        }
    }
}

