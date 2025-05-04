# Roo-Xcode Developer Guide

This document provides information for developers who want to understand, use, or extend the Roo-Xcode extension.

## Overview

Roo-Xcode is an Xcode extension that provides functionality similar to the Roo-Code VSCode extension. It adds commands to Xcode's Editor menu that allow you to:

- Insert comments and code snippets
- Track command history
- Simulate dialogs and UI interactions
- Manipulate source code

## Project Structure

- `RooXcodeExtension/` - Main extension target
  - `Sources/` - Swift source files
    - `RooXcodeExtension.swift` - Main entry point for the extension
    - `RooXcodeUtility.swift` - Shared utility class for all commands
    - Command classes (e.g., `RooXcodeCommand.swift`) - Individual command implementations
  - `Info.plist` - Extension configuration and command definitions
  - `Assets.xcassets/` - Asset catalog
  - `en.lproj/Localizable.strings` - Localization

- `Tests/` - Unit tests for the extension

## Command Classes

Each command in the extension is implemented as a separate class that conforms to the `XCSourceEditorCommand` protocol. The commands are:

1. `RooXcodeCommand` - "Plus Button Clicked" command
2. `RooXcodeSettingsCommand` - "Settings Button Clicked" command
3. `RooXcodePromptsCommand` - "Prompts Button Clicked" command
4. `RooXcodeMcpCommand` - "MCP Button Clicked" command
5. `RooXcodeHistoryCommand` - "History Button Clicked" command
6. `RooXcodeAcceptInputCommand` - "Accept Input" command
7. `RooXcodeHumanRelayCommand` - "Show Human Relay Dialog" command

Each command is registered in the `Info.plist` file with a unique identifier and display name.

## Shared Utility

The `RooXcodeUtility` class provides shared functionality for all commands, including:

- Command history tracking
- Timestamp generation
- State management

This class is implemented as a singleton, so all commands can access the same instance.

## Testing

The `Tests/RooXcodeExtensionTests.swift` file contains unit tests for the extension. It includes:

- Tests for the `RooXcodeUtility` class
- Tests for the command classes
- Mock classes for testing

## Adding New Commands

To add a new command:

1. Create a new Swift file in the `Sources/` directory
2. Implement a class that conforms to `XCSourceEditorCommand`
3. Add an entry to the `XCSourceEditorCommandDefinitions` array in `Info.plist`

Example:

```swift
import Foundation
import XcodeKit

class MyNewCommand: NSObject, XCSourceEditorCommand {
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void) {
        // Implement your command logic here
        invocation.buffer.lines.insert("// My new command", at: 0)
        completionHandler(nil)
    }
}
```

## Building and Running

To build and run the extension:

1. Open the project in Xcode
2. Build the extension target
3. Run the extension in Xcode's Extension Host
4. Enable the extension in System Preferences > Extensions > Xcode Source Editor

## Debugging

To debug the extension:

1. Add print statements to your code
2. Check the system log for output
3. Use the unit tests to verify functionality

## Comparison with Roo-Code

This extension implements functionality similar to the Roo-Code VSCode extension, but with the limitations of the Xcode extension API. The main differences are:

- No custom UI or webviews (Xcode extensions can only add commands to the Editor menu)
- Limited interaction with the user (no dialogs, only source code manipulation)
- No access to the file system or network

Despite these limitations, the extension provides similar functionality by:

- Using comments to simulate UI interactions
- Using the `RooXcodeUtility` class to maintain state
- Implementing commands that correspond to Roo-Code commands