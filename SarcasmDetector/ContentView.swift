//
//  ContentView.swift
//  SarcasmDetector
//
//  Created by Dungeon_master on 15/06/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = SarcasmViewModel()
    @State private var inputText: String = ""
    @State private var isSarcastic: Bool = false
    @State private var statusMessage: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Sarcasm Detector")
                .font(.title)
                .bold()

            TextField("Enter a sentence...", text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            VStack {
                HStack(spacing: 16) {
                    Button("Detect Sarcasm") {
                        if !inputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                            viewModel.predict(text: inputText)
                            statusMessage = ""
                            inputText = ""
                        } else {
                            statusMessage = "Input is empty. No prediction performed."
                            print("Input is empty. No prediction performed.")
                        }
                        
                    }
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .cornerRadius(10)
                    Button("Clear") {
                        inputText = ""
                        statusMessage = ""
                        viewModel.isSarcastic = false
                        viewModel.result = nil
                    }
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .cornerRadius(10)
                }
                .frame(maxWidth: .infinity)
                .padding()
            }
            
            if !statusMessage.isEmpty {
                    Text(statusMessage)
                        .foregroundColor(.red)
                        .font(.subheadline)
                        .padding(.top, 10)
                }
            if let result = viewModel.result {
                Text(String(format: "Probability: %.2f", result))
                    .font(.headline)

                Text(viewModel.isSarcastic == true ? "Detected Sarcastic Score" : "Not Sarcastic Score")
                    .foregroundColor(viewModel.isSarcastic == true ? .red : .green)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                 
            }
            Spacer()
        }
        .padding()
    }
}
