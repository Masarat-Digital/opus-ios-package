import Foundation

public enum OKPasswordValidator {}

public extension OKPasswordValidator {
    enum Warning {
        case none
        case length
        case uppercase
        case lowercase
        case digit
        case specialCharacter
    }
}

public extension OKPasswordValidator {
    static func verify(_ text: String?) -> OKPasswordValidator.Warning {
        guard let text, text.count >= K.minLength else { return .length }
        var hasUppercase = false
        var hasLowercase = false
        var hasDigit = false
        var hasSpecialCharacter = false

        for char in text {
            if char.isUppercase { hasUppercase = true }
            else if char.isLowercase { hasLowercase = true }
            else if char.isNumber { hasDigit = true }
            else { hasSpecialCharacter = true }
            if hasUppercase, hasLowercase, hasDigit, hasSpecialCharacter { return .none }
        }

        if !hasUppercase { return .uppercase }
        if !hasLowercase { return .lowercase }
        if !hasDigit { return .digit }
        if !hasSpecialCharacter { return .specialCharacter }

        return .none
    }
}

// MARK: - Constants

private enum K {
    static let minLength: Int = 8
}
