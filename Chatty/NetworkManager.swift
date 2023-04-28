//
//  Copyright © Uber Technologies, Inc. All rights reserved.
//


import Foundation


let encoder = JSONEncoder()

private enum GPTCategory {
    case grammarCorrection
    case chatBot
    
    var endpoint: String {
        let baseURL = "https://api.openai.com/v1"
        let addition: String
        
        switch self {
        case .grammarCorrection:
            addition = "/completions"
        case .chatBot:
            addition = "/completions"
        }
        return baseURL + addition
    }
    
    func httpbody(with text: String) -> Data? {
        let model = ChatGPTRequestModel(
            model: "text-davinci-003",
            prompt: UserData.s.prompt,
            temperature: 0.9,
            maxTokens: 150,
            topP: 1,
            frequencyPenalty: 0,
            presencePenalty: 0.6,
            stop: [" Human:", " AI:"]
        )
        return try? encoder.encode(model)
    }
}

private func networkRequestObj(for cat: GPTCategory, prompt: String) -> URLRequest {
    UserData.s.updatePrompt(with: prompt, entity: .human)
    let chatGPTkey = "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"
    let headers: [String: String] = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(chatGPTkey)"
        ]
    
    let url = URL(string: cat.endpoint)!
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "POST"
    urlRequest.httpBody = cat.httpbody(with: prompt)
    headers.forEach { urlRequest.setValue($1, forHTTPHeaderField: $0) }
    
    return urlRequest
}

func correctGrammar(_ prompt: String, completion: ((String) -> Void)?) {
    if prompt.isEmpty {
        completion?("Empty prompt?")
        return
    }
    let networkReq = networkRequestObj(for: .chatBot, prompt: prompt)
    print("network request: \(networkReq)")
    print(networkReq.allHTTPHeaderFields!)
    print(String(data: networkReq.httpBody!, encoding: .utf8)!)
    
    
    URLSession.shared.dataTask(with: networkReq) {
        data, urlResponse, error in
        
        print(String(data: data!, encoding: .utf8))
        if let data = data,
            let response = try? JSONDecoder().decode(ChatGPTResponseModel.self, from: data) {
            let replyTxt = response.choices?.first?.text ?? ""
            UserData.s.updatePrompt(with: replyTxt, entity: .AI)
            completion?(replyTxt)
        } else {
            completion?(error?.localizedDescription ?? "")
        }
    }.resume()
     
}

