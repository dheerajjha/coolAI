//
//  Copyright © Uber Technologies, Inc. All rights reserved.
//


import Foundation
import MessageKit

struct User: SenderType {
    var senderId: String = "sender"
    var displayName: String = "Dheeraj"
}

enum Entity {
    case human
    case AI
}

final class UserData {
    
    private init() {}
    
    static let s = UserData()
    
    let current = User()
    
    var prompt: String = "The following is a conversation with an AI assistant. The assistant is helpful, creative, clever, and very friendly.\n\nHuman: Hello, who are you?\nAI: I am an AI created by OpenAI. How can I help you today?\nHuman: "
    
    func updatePrompt(with text: String, entity: Entity) {
        switch entity {
        case .human:
            prompt = prompt + text + "\nAI:"
        case .AI:
            prompt = prompt + text + "\nHuman: "
        }
    }
}
