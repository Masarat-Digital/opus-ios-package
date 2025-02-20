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
        guard let text else { return .none }
        guard text.count >= K.minLenght else { return .length }
        guard text.first(where: { $0.isUppercase }).isNotNil else { return .uppercase }
        guard text.first(where: { $0.isLowercase }).isNotNil else { return .lowercase }
        guard text.first(where: { $0.isNumber }).isNotNil else { return .digit }
        guard text.range(of: "[^a-zA-Z0-9]", options: .regularExpression).isNotNil else { return .digit }
        return .none
    }
}

// MARK: - Constants

private enum K {
    static let minLenght: Int = 8
}
