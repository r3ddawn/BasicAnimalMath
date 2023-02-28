//
//  ContentView.swift
//  BasicAnimalMath
//
//  Created by Eric Johnson on 2/27/23.
//

import SwiftUI

struct AdditionProblems {
    
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.green.ignoresSafeArea()
                VStack {
                    
                    Spacer()
                    
                    VStack {
                        Section {
                            HStack {
                                ForEach(0..<4, id: \.self) { num in
                                    Image("giraffe")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .scaledToFit()
                                }
                            }
                            
                            Text("4")
                                .font(.system(size: 40))
                                .foregroundColor(.primary)
                                .padding()
                            Image(systemName: "plus")
                                .font(.system(size: 50))
                                .foregroundColor(.white)
                                .padding()
                            Text("2")
                                .font(.system(size: 40))
                                .foregroundColor(.primary)
                                .padding()
                            
                            HStack {
                                ForEach(0..<2, id: \.self) { num in
                                    Image("giraffe")
                                        .resizable()
                                        .frame(width: 50, height: 50)
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
                                Button("\(num)") {
                                    //Do Something
                                }
                                .foregroundColor(.primary)
                            }
                        }
                        .frame(width: 250, height: 50)
                        .background(.thinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                    } // Answer Picker Window
                    
                    Spacer()
                }
            }
            .navigationTitle("🦁 Basic Animal Math 🐮")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    // Code to come
                } label: {
                    Image(systemName: "gearshape")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
