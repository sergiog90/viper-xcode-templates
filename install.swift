//
//  main.swift
//  viper
//
//  Created by Sergio García on 22/02/2020.
//  Copyright © 2020 Sergio García. All rights reserved.
//
//#!/usr/bin/swift

import Foundation

extension URL {
    private static let home = FileManager.default.homeDirectoryForCurrentUser
    static let templates = home.appendingPathComponent("Library/Developer/Xcode/Templates")
    static let viper = templates.appendingPathComponent("VIPER")
    static let viperTemplate = viper.appendingPathComponent("Templates")
}

class VIPERFileManager: FileManager {

    enum VIPERFileManagerError: Error, LocalizedError {
        case template
        case remove
        case install

        var errorDescription: String? {
            switch self {
            case .template: return "Error preparing default template directory."
            case .remove: return "Error removing current VIPER template directory"
            case .install: return "Error installing VIPER templates."
            }
        }
    }

    private var templatesExists: Bool { return fileExists(atPath: URL.templates.path) }
    private var viperExists: Bool { return fileExists(atPath: URL.viper.path) }

    func createTemplatesDirectoryIfNeeded() throws {
        guard !templatesExists else { return }
        do {
            debugPrint("INFO: Creating Xcode Templates directory..")
            try createDirectory(at: URL.templates, withIntermediateDirectories: true, attributes: nil)
        } catch {
            throw VIPERFileManagerError.template
        }
    }

    private func removeViper() throws {
        do {
            debugPrint("WARN: Removing current VIPER Template")
            try removeItem(at: URL.viper)
        } catch {
            throw VIPERFileManagerError.remove
        }

    }

    func installViper() throws {
        if viperExists {
            try removeViper()
        }
        do {
            debugPrint("INFO: Installing VIPER Template")
            let templates = URL(fileURLWithPath: currentDirectoryPath, isDirectory: true)
                .appendingPathComponent("Templates")
            try copyItem(at: templates, to: URL.viper)
            try installSharedTemplates()
            try installSharedTests()
        } catch {
            debugPrint(error)
            throw VIPERFileManagerError.install
        }
    }

    private func installSharedTemplates() throws {
        let templates = URL(fileURLWithPath: currentDirectoryPath, isDirectory: true).appendingPathComponent("Shared/Templates")
        do {
            debugPrint("INFO: Installing VIPER Shared Template")
            try copyContent(at: templates, to: URL.viper.appendingPathComponent("Module (Storyboard).xctemplate", isDirectory: true))
            try copyContent(at: templates, to: URL.viper.appendingPathComponent("Module (Without View).xctemplate", isDirectory: true))
            try copyContent(at: templates, to: URL.viper.appendingPathComponent("Module (Xib).xctemplate", isDirectory: true))
        } catch {
            throw VIPERFileManagerError.install
        }
    }

    private func installSharedTests() throws {
        let templates = URL(fileURLWithPath: currentDirectoryPath, isDirectory: true).appendingPathComponent("Shared/Tests")
        do {
            debugPrint("INFO: Installing VIPER Shared Tests Template")
            try copyContent(at: templates, to: URL.viper.appendingPathComponent("Module Tests (Storyboard).xctemplate", isDirectory: true))
            try copyContent(at: templates, to: URL.viper.appendingPathComponent("Module Tests.xctemplate", isDirectory: true))
        } catch {
            throw VIPERFileManagerError.install
        }
    }

    private func copyContent(at: URL, to: URL) throws {
        let content = try contentsOfDirectory(at: at, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
        for item in content {
            try copyItem(at: item, to: to.appendingPathComponent(item.lastPathComponent))
        }
    }
}


let fileManager = VIPERFileManager()
do {
    try fileManager.createTemplatesDirectoryIfNeeded()
    try fileManager.installViper()
} catch {
    print(error.localizedDescription)
}