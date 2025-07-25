//
//  CrossPlatformLoginApp.swift
//  cross-platform-login
//
//  Created by Hitesh Sapra on 15/07/2025.
//
//  © 2025 CodeFusion Bit LLP. All rights reserved.
//  Website: https://www.codefusionbit.com
//


import Foundation
import SkipFuse
import SwiftUI

enum AppRoute: Hashable {
    case login
    case main
}


/// A logger for the CrossPlatformLogin module.
let logger: Logger = Logger(subsystem: "com.codefusionbit.CrossPlatformLogin", category: "CrossPlatformLogin")

/// The shared top-level view for the app, loaded from the platform-specific App delegates below.
///
/// The default implementation merely loads the `ContentView` for the app and logs a message.
/* SKIP @bridge */public struct CrossPlatformLoginRootView : View {
    /* SKIP @bridge */public init() {
    }

    public var body: some View {
        RootViewRouter()
            .task {
                logger.info("Skip app logs are viewable in the Xcode console for iOS; Android logs can be viewed in Studio or using adb logcat")
            }
    }
}

/// Global application delegate functions.
///
/// These functions can update a shared observable object to communicate app state changes to interested views.
/* SKIP @bridge */public final class CrossPlatformLoginAppDelegate : Sendable {
    /* SKIP @bridge */public static let shared = CrossPlatformLoginAppDelegate()

    private init() {
    }

    /* SKIP @bridge */public func onInit() {
        logger.debug("onInit")
    }

    /* SKIP @bridge */public func onLaunch() {
        logger.debug("onLaunch")
    }

    /* SKIP @bridge */public func onResume() {
        logger.debug("onResume")
    }

    /* SKIP @bridge */public func onPause() {
        logger.debug("onPause")
    }

    /* SKIP @bridge */public func onStop() {
        logger.debug("onStop")
    }

    /* SKIP @bridge */public func onDestroy() {
        logger.debug("onDestroy")
    }

    /* SKIP @bridge */public func onLowMemory() {
        logger.debug("onLowMemory")
    }
}
