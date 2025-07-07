//
//  SarcasmViewModel.swift
//  SarcasmDetector
//
//  Created by Dungeon_master on 15/06/25.
//

import Foundation
import CoreML

class SarcasmViewModel: ObservableObject {
    private let model = try? SarcasmDetector(configuration: MLModelConfiguration())

    @Published var result: Double?
    @Published var isSarcastic: Bool?

    func predict(text: String) {
        guard let tokenizer = loadTokenizer(),
              let input = preprocess(text: text, tokenizer: tokenizer),
              let model = model else {
            print("Model or preprocessing failed")
            return
        }

        do {
            let output = try model.prediction(embedding_input: input)
            let prediction = output.Identity[0].doubleValue // Replace Identity if needed
            DispatchQueue.main.async {
                self.result = prediction
                self.isSarcastic = prediction > 0.5
            }
        } catch {
            print("Prediction error: \(error)")
        }
    }

    private func preprocess(text: String, tokenizer: [String: Int]) -> MLMultiArray? {
        let words = text.lowercased().split(separator: " ").map { String($0) }
        let maxLength = 100
        let padded = Array(words.prefix(maxLength)).map { tokenizer[$0] ?? 1 }
        let paddedFinal = padded + Array(repeating: 0, count: max(0, maxLength - padded.count))

        do {
            let mlArray = try MLMultiArray(shape: [1, 100], dataType: .int32)
            for (i, value) in paddedFinal.enumerated() {
                mlArray[i] = NSNumber(value: value)
            }
            return mlArray
        } catch {
            print("MLMultiArray error: \(error)")
            return nil
        }
    }

    private func loadTokenizer() -> [String: Int]? {
        return [
            "yeah": 5,
            "i": 8,
            "just": 9,
            "love": 10,
            "getting": 11,
            "stuck": 12,
            "in": 13,
            "traffic": 14,
            "for": 15,
            "hours": 16
            // Add more words here or load from JSON
        ]
    }
}
