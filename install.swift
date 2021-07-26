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
            let inheritance = URL(fileURLWithPath: currentDirectoryPath, isDirectory: true)
                .appendingPathComponent("Inheritance").appendingPathComponent("Templates")
            let protocols = URL(fileURLWithPath: currentDirectoryPath, isDirectory: true)
                .appendingPathComponent("Protocols").appendingPathComponent("Templates")
            // TODO: Make URL.viper directory and copy contents of base and protocols to this pathx
            try createDirectory(at: URL.viper, withIntermediateDirectories: true, attributes: nil)

            try copyContent(at: inheritance, to: URL.viper)
            try copyContent(at: protocols, to: URL.viper)
//            try copyItem(at: base, to: URL.viper)
//            try copyItem(at: protocols, to: URL.viper)
            try installProtocolsSharedTemplates()
            try installProtocolsSharedTests()

        } catch {
            debugPrint(error)
            throw VIPERFileManagerError.install
        }
    }

    private func installProtocolsSharedTemplates() throws {
        let templates = URL(fileURLWithPath: currentDirectoryPath, isDirectory: true).appendingPathComponent("Protocols/Shared/Templates")
        do {
            debugPrint("INFO: Installing VIPER Shared Template")
            try copyContent(at: templates, to: URL.viper.appendingPathComponent("VIPER Module Protocol (Storyboard).xctemplate", isDirectory: true))
            try copyContent(at: templates, to: URL.viper.appendingPathComponent("VIPER Module Protocol (Without View).xctemplate", isDirectory: true))
            try copyContent(at: templates, to: URL.viper.appendingPathComponent("VIPER Module Protocol (Xib).xctemplate", isDirectory: true))
        } catch {
            throw VIPERFileManagerError.install
        }
    }

    private func installProtocolsSharedTests() throws {
        let templates = URL(fileURLWithPath: currentDirectoryPath, isDirectory: true).appendingPathComponent("Protocols/Shared/Tests")
        do {
            debugPrint("INFO: Installing VIPER Shared Tests Template")
            try copyContent(at: templates, to: URL.viper.appendingPathComponent("VIPER Module Protocol Tests (Storyboard).xctemplate", isDirectory: true))
            try copyContent(at: templates, to: URL.viper.appendingPathComponent("VIPER Module Protocol Tests.xctemplate", isDirectory: true))
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
