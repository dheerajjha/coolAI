//
//  Copyright © Uber Technologies, Inc. All rights reserved.
//


import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - ChatGPTRequestModel
struct ChatGPTRequestModel: Codable {
    var model, prompt: String?
    var temperature, maxTokens, topP, frequencyPenalty: Double?
    var presencePenalty: Double?
    var stop: [String]?

    enum CodingKeys: String, CodingKey {
        case model, prompt, temperature
        case maxTokens = "max_tokens"
        case topP = "top_p"
        case frequencyPenalty = "frequency_penalty"
        case presencePenalty = "presence_penalty"
        case stop
    }
}

// MARK: - ChatGPTResponseModel
struct ChatGPTResponseModel: Codable {
    var id, object: String?
    var created: Int?
    var model: String?
    var choices: [Choice]?
    var usage: Usage?
}

// MARK: - Choice
struct Choice: Codable {
    var text: String?
    var index: Int?
    var logprobs: JSONNull?
    var finishReason: String?

    enum CodingKeys: String, CodingKey {
        case text, index, logprobs
        case finishReason = "finish_reason"
    }
}

// MARK: - Usage
struct Usage: Codable {
    var promptTokens, completionTokens, totalTokens: Int?

    enum CodingKeys: String, CodingKey {
        case promptTokens = "prompt_tokens"
        case completionTokens = "completion_tokens"
        case totalTokens = "total_tokens"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
