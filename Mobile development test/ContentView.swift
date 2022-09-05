//
//  ContentView.swift
//  Mobile development test
//
//  Created by Ильгам Нафиков on 13.05.2022.
//

import SwiftUI
import FirebaseFirestore
import Firebase
import Foundation

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    @State var currentQuestion = 0
    @State var isFinished = false
    
    var body: some View {
        if !isFinished {
            if !viewModel.isLoading {
                if currentQuestion != 0 {
                    if viewModel.questions.count != 0 {
                        VStack(alignment: .center) {
                            Text(viewModel.questions[currentQuestion])
                                .frame(width: 340)
                                .font(Font.custom("Verdana", size: 20))
                                .multilineTextAlignment(.center)
                            
                            Spacer()
                                .frame(height: 50)
                            
                            VStack(spacing: 20) {
                                Button {
                                    viewModel.usersQuestionsAnswer[currentQuestion] = "0"
                                } label: {
                                        Text(viewModel.answers[currentQuestion][0])
                                        .foregroundColor(.white)
                                            .frame(width: 340)
                                            .padding()
                                            .background(Rectangle()
                                                .frame(width: 350)
                                                .foregroundColor(viewModel.usersQuestionsAnswer[currentQuestion] == "0" ? .gray : .black)
                                                .cornerRadius(15))
                                }
                                Button {
                                    viewModel.usersQuestionsAnswer[currentQuestion] = "1"
                                } label: {
                                    Text(viewModel.answers[currentQuestion][1])
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(width: 340)
                                        .background(Rectangle()
                                            .frame(width: 350, height: .infinity)
                                            .foregroundColor(viewModel.usersQuestionsAnswer[currentQuestion] == "1" ? .gray : .black)
                                            .cornerRadius(15))
                                }
                                
                                Button {
                                    viewModel.usersQuestionsAnswer[currentQuestion] = "2"
                                } label: {
                                    Text(viewModel.answers[currentQuestion][2])
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(width: 340)
                                        .background(Rectangle()
                                            .frame(width: 350, height: .infinity)
                                            .foregroundColor(viewModel.usersQuestionsAnswer[currentQuestion] == "2" ? .gray : .black)
                                            .cornerRadius(15))
                                }
                                Button {
                                    viewModel.usersQuestionsAnswer[currentQuestion] = "3"
                                } label: {
                                    Text(viewModel.answers[currentQuestion][3])
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(width: 340)
                                        .background(Rectangle()
                                            .frame(width: 350, height: .infinity)
                                            .foregroundColor(viewModel.usersQuestionsAnswer[currentQuestion] == "3" ? .gray : .black)
                                            .cornerRadius(15))
                                }
            
                            }
                            
                            Spacer()
                                .frame(height: 50)
                            
                            Text("\(currentQuestion)/\(viewModel.questions.count - 1) вопрос")
        //                        .offset(y: -200)
        //                        .font(c)
                                .font(Font.custom("Verdana", size: 15)).bold()
                                .multilineTextAlignment(.center)
                            
                            HStack {
                                Button {
                                    if currentQuestion - 1 > 0 {
                                        currentQuestion -= 1
                                    }

                                } label: {
                                    ZStack {
                                        Rectangle()
                                            .foregroundColor(.black)
                                            .frame(width: 50, height: 50)
                                            .cornerRadius(15)
                                        
                                        Image(systemName: "arrow.left")
                                            .resizable()
                                            .foregroundColor(.white)
                                            .frame(width: 25, height: 20)
                                    }
                                }
                                
                                Button {
                                    if currentQuestion + 1 < viewModel.questions.count {
                                        currentQuestion += 1
                                    }

                                } label: {
                                    ZStack {
                                        Rectangle()
                                            .foregroundColor(.black)
                                            .frame(width: 50, height: 50)
                                            .cornerRadius(15)
                                        
                                        Image(systemName: "arrow.right")
                                            .resizable()
                                            .foregroundColor(.white)
                                            .frame(width: 25, height: 20)

                                    }
                                }
                            }
                            
                            Button {
                                isFinished = true
                                viewModel.calculateResult()
                            } label: {
                                Text("Закончить тест")
                                    .foregroundColor(.white)
                                    .frame(width: 150, height: 50)
                                    .background(Rectangle()
                                        .foregroundColor(.black)
                                        .cornerRadius(15)
                                    )
                            }
                            
                        }
                    } else {
                        ZStack {
                            Color(.black)
                                .ignoresSafeArea()
                            
                            Text("\(viewModel.questions.count)")
                                .foregroundColor(.white)
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                .scaleEffect(3)
                    }
                }
                } else {
                    VStack {
                        Text("Тест по мобильной разработке")
                            .font(Font.custom("Verdana", size: 25)).bold()
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                            .frame(height: 50)
                        
                        Text("Проверьте ваш уровень знаний в мобильной разработке 📱")
                            .font(Font.custom("Verdana", size: 20))
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                            .frame(height: 50)
                        
                        Button {
                            currentQuestion += 1
                        } label: {
                            Text("Поехали!")
                                .foregroundColor(.white)
                                .padding()
                                .background(Rectangle()
                                    .foregroundColor(.black)
                                    .cornerRadius(15))
                            
                        }
                        
                        Text("Работу выполнили: Бабушкина, Нафиков, Сенюкова")
                            .font(Font.custom("Verdana", size: 10))
                            .offset(y: 230)
                        
                    }
                }
            
            } else {
                ZStack {
                    Color(.black)
                        .ignoresSafeArea()
                    
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .scaleEffect(3)
                }
            }
        } else {
            VStack {
                Text("Вы успешно прошли тест по мобильной разработке")
                    .font(Font.custom("Verdana", size: 25)).bold()
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .frame(width: 350)
                
                Spacer()
                    .frame(height: 50)
                
                Text("Вы набрали \(viewModel.countOfCorrect) из \(viewModel.questions.count - 1) правильных ответов")
                    .font(Font.custom("Verdana", size: 20))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .frame(width: 340)
                
                Spacer()
                    .frame(height: 10)
                
                Text("*\(viewModel.textForResult)*")
                    .font(Font.custom("Verdana", size: 20))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .frame(width: 340)
                
                Spacer()
                    .frame(height: 50)
                
                Button {
                    currentQuestion = 1
                    isFinished = false
                    viewModel.countOfCorrect = 0
                    viewModel.textForResult = ""
                    viewModel.usersQuestionsAnswer = Array(repeating: "", count: viewModel.questions.count)
                    
                } label: {
                    Text("Пройти еще раз?")
                        .foregroundColor(.white)
                        .padding()
                        .background(Rectangle()
                            .foregroundColor(.black)
                            .cornerRadius(15))
                    
                }
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AppViewModel())
    }
}
