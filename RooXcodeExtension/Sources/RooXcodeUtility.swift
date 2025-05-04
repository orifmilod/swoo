// RooXcodeUtility.swift
// Shared utility class for RooXcodeExtension commands.

import Foundation
import XcodeKit

/// Singleton utility class for RooXcodeExtension.
/// This class provides shared functionality and state management for all commands.
class RooXcodeUtility {
    // Singleton instance
    static let shared = RooXcodeUtility()
    
    // Private initializer for singleton
    private init() {}
    
    // Example state variables
    private var lastCommand: String?
    private var commandHistory: [String] = []
    
    // Record a command execution
    func recordCommand(_ commandName: String) {
        lastCommand = commandName
        commandHistory.append(commandName)
        print("RooXcodeExtension: Executed command: \(commandName)")
    }
    
    // Get the command history
    func getCommandHistory() -> [String] {
        return commandHistory
    }
    
    // Clear the command history
    func clearCommandHistory() {
        commandHistory.removeAll()
    }
    
    // Example method to generate a timestamp comment
    func generateTimestampComment() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let timestamp = dateFormatter.string(from: Date())
        return "// RooXcodeExtension: Command executed at \(timestamp)"
    }
}