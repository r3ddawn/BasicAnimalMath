//
//  ContentView.swift
//  BasicAnimalMath
//
//  Created by Eric Johnson on 2/27/23.
//

import SwiftUI

struct ContentView: View {
    @State private var usedSet = [Int]()
    @State private var currentKey = 0
    @State private var answerPosition = 0
    @State private var wrongAnswers = [Int]()
    
    @State private var wrongAnswersRed = false
    
    @State private var currentAnimal = "giraffe"
    let problemSet = AdditionProblems()
    
    let animalTypes = ["bear", "buffalo", "chick", "chicken", "cow", "crocodile", "dog", "duck", "elephant", "frog", "giraffe", "goat", "gorilla", "hippo", "horse", "monkey", "moose", "narwhal", "owl", "panda", "parrot", "penguin", "pig", "rabbit", "rhino", "sloth", "snake", "walrus", "whale", "zebra"]
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.green.ignoresSafeArea()
                VStack {

                    Spacer()

                    VStack {
                        Section {
                            HStack {
                                ForEach(0..<problemSet.getFirstNumber(currentKey), id: \.self) { num in
                                    Image(currentAnimal)
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                        .scaledToFit()
                                        
                                }
                            }
                                Text("\(problemSet.getFirstNumber(currentKey))")
                                    .font(.system(size: 40))
                                    .foregroundColor(.primary)
                                    .padding()
                                Image(systemName: "plus")
                                    .font(.system(size: 50))
                                    .foregroundColor(.white)
                                    .padding()
                                Text("\(problemSet.getSecondNumber(currentKey))")
                                    .font(.system(size: 40))
                                    .foregroundColor(.primary)
                                    .padding()

                            HStack {
                                ForEach(0..<problemSet.getSecondNumber(currentKey), id: \.self) { num in
                                    Image(currentAnimal)
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                        .scaledToFit()
                                }
                            }
                        }
                    } // Problem Window
                    .frame(width: 300, height: 400)
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 25))

                    Spacer()

                    VStack {
                        Section {
                            ForEach(0..<4, id:\.self) { num in
                                if num == answerPosition {
                                    Text("\(problemSet.getAnswer(number: currentKey))")
                                    .foregroundColor(.primary)
                                    .frame(width: 250, height: 50)
                                    .background(.thinMaterial)
                                    .contentShape(Rectangle())
                                    .clipShape(RoundedRectangle(cornerRadius: 25))
                                    .onTapGesture {
                                        startGame()
                                    }
                                } else {
                                    Text("\(wrongAnswers[num])")
                                        .foregroundColor(wrongAnswersRed ? .red : .primary)
                                        .frame(width: 250, height: 50)
                                        .background(.thinMaterial)
                                        .contentShape(Rectangle())
                                        .clipShape(RoundedRectangle(cornerRadius: 25))
                                        .onTapGesture {
                                            wrongAnswersRed = true
                                        }
                                }
                            }
                        }
                    } // Answer Picker Window

                    Spacer()
                }
            }
            .navigationTitle("🦁 Basic Animal Math 🐮")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
//                Button {
//                    // Code to come
//                } label: {
//                    Image(systemName: "gearshape")
//                }
            }
        }
        .onAppear(perform: startGame)
    }
    
    func startGame() {
        getRandomKey()
        newAnswerPosition()
        setWrongAnswers()
        setCurrentAnimal()
        wrongAnswersRed = false
        
    }
    func getRandomKey() {
        var newKey = Int.random(in: 0..<problemSet.count())
        while usedSet.contains(newKey) {
            newKey = Int.random(in: 0..<problemSet.count())
        }
        
        //Making sure you never run out of questions but trying to keep duplicates to a minimum
        if usedSet.count == (problemSet.count() / 2) {
            usedSet = [Int]()
            
        }
        
        usedSet.append(newKey)
        currentKey = newKey
    }
    
    func newAnswerPosition() {
        answerPosition = Int.random(in: 0...3)
    }
    
    func setWrongAnswers() {
        let rightAnswer = problemSet.getAnswer(number: currentKey)
        var newWrongAnswer = getWrongAnswer()
        var newWrongAnswerArray = [Int]()
        
        for _ in 1...4 {
            while rightAnswer == newWrongAnswer || newWrongAnswerArray.contains(newWrongAnswer) {
                newWrongAnswer = getWrongAnswer()
            }
            
            newWrongAnswerArray.append(newWrongAnswer)
        }
        wrongAnswers = newWrongAnswerArray
    }
    
    func getWrongAnswer() -> Int {
        let randomKey = Int.random(in: 0..<problemSet.count())
        return problemSet.getAnswer(number: randomKey)
    }
    
    func setCurrentAnimal() {
        let randomKey = Int.random(in: 0..<animalTypes.count)
        currentAnimal = animalTypes[randomKey]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
