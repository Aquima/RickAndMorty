// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum IntroLocalizable {
  internal enum Message {
    internal enum Text {
      /// By pressing the button, you will be able to view the characters. Don't hesitate, click that button now!
      internal static let normal = IntroLocalizable.tr("IntroLocalizable", "message.text.normal", fallback: "By pressing the button, you will be able to view the characters. Don't hesitate, click that button now!")
    }
  }
  internal enum Title {
    internal enum Button {
      /// IntroLocalizable.strings
      ///   RickAndMorty
      /// 
      ///   Created by Raul Quispe  on 25/09/23.
      internal static let normal = IntroLocalizable.tr("IntroLocalizable", "title.button.normal", fallback: "Enter")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension IntroLocalizable {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
