import Foundation
import SwiftUI

enum Feature: String, CaseIterable, Identifiable {
    case uiKitTextView
    case deepLinkNavigation
    case coreDataBatchUpdate
    case customComponents
    case formValidation
    case gestures

    var id: String { rawValue }

    var title: String {
        switch self {
        case .uiKitTextView:        return "UIKit Integration — UITextView"
        case .deepLinkNavigation:   return "Advanced Navigation — Deep Link"
        case .coreDataBatchUpdate:  return "CoreData Optimization — Batch Update"
        case .customComponents:     return "Custom Components — Button & Toast"
        case .formValidation:       return "Form Validations — Regex & Logic"
        case .gestures:             return "SwiftUI Gestures — Drag & Drop"
        }
    }

    @ViewBuilder
    var destination: some View {
        switch self {
        case .uiKitTextView:        UIKitTextViewDemo()
        case .deepLinkNavigation:   DeepLinkNavigationDemo()
        case .coreDataBatchUpdate:  CoreDataBatchUpdateDemo()
        case .customComponents:     CustomComponentsDemo()
        case .formValidation:       FormValidationDemo()
        case .gestures:             GesturesDemo()
        }
    }
}
