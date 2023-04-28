//
//  Copyright © Uber Technologies, Inc. All rights reserved.
//


import MessageKit
import Foundation

struct GPT: SenderType {
    var senderId: String
    var displayName: String
}

private var _gptChatMessageID: Int = 0
var gptChatMessageID: String {
    _gptChatMessageID += 1
    return String(_gptChatMessageID)
}

struct GPTChatMessage: MessageType {
    var sender: MessageKit.SenderType = GPT(senderId: "gpt", displayName: botName)
    var messageId: String = gptChatMessageID
    var sentDate: Date = Date()
    var kind: MessageKit.MessageKind
}
