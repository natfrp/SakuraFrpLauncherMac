//
//  LogModel.swift
//  SakuraLauncher
//
//  Created by FENGberd on 6/8/21.
//

import SwiftUI

enum LogLevel: String {
    case info = "I",
         warning = "W",
         error = "E"
    case none = ""
}

class LogModel {
    static let pattern = try! NSRegularExpression(pattern: #"(?<Time>\d{4}/\d{2}/\d{2} \d{2}:\d{2}:\d{2}) \[(?<Level>[DIWE])\] (?:\[[a-zA-Z0-9\-_\.]+:\d+\] )?(?<Content>.+)"#)

    var id = UUID()

    var source: String
    var time: String
    var level: LogLevel
    var data: String

    init(source: String, data: String, time: String = "", level: LogLevel = .none) {
        self.source = source
        self.time = time
        self.level = level
        self.data = data
    }

    func levelColor() -> Color {
        switch level {
        case .warning:
            return Color.orange
        case .error:
            return Color(red: 0.86, green: 0.31, blue: 0.21)
        default:
            return Color.white
        }
    }
}
