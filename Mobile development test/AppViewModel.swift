//
//  AppViewModel.swift
//  Mobile development test
//
//  Created by Ильгам Нафиков on 13.05.2022.
//
import SwiftUI
import Firebase
import Foundation
import FirebaseFirestore
import Combine

class AppViewModel: ObservableObject {
    let db = Firestore.firestore()

    @Published var questions: Array<String> = [""]
    @Published var answers: Array<Array<String>> = [["", "", "", ""]]
    @Published var correctAnswers: Array<String> = [""]
    @Published var usersQuestionsAnswer: Array<String> = [""]
    @Published var isLoading = false
    @Published var countOfCorrect = 0
    @Published var textForResult = ""
    
    func loadQuestions() {
        isLoading = true
        
        let docRef = db.collection("questions")
        docRef.getDocuments { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    self.questions.append(document["question"] as! String)
                    self.answers.append(document["answers"] as! Array<String>)
                    self.correctAnswers.append(document["correct answer"] as! String)
                    self.usersQuestionsAnswer.append("")
                }
            }
        }
        
        DispatchQueue.main.async {
            self.isLoading = false
        }
    }
    
    func calculateResult() {
        for i in 1...questions.count - 1{
            if usersQuestionsAnswer[i] == correctAnswers[i] {
                countOfCorrect += 1
            }
        }
        
        switch countOfCorrect {
            case 0...15:
                textForResult = "Вы новичок в разработке, однако, вы обладаете неплохими знаниями в этой сфере"
            case 15...30:
                textForResult = "Вы Junior в разработке, вам есть куда расти)"
            case 30...40:
                textForResult = "Вы Middle в разработке, вы почти проффесионал в этой сфере"
            default:
                textForResult = "Вы Senior, у вас отличные знания"
        }
        
    }
}
