import Foundation

public enum Validator {}

// MARK: - Password

public extension Validator {
    static func password(_ text: String) -> PasswordValidation {
        guard text.count >= K.Password.minLength else { return .invalidCount }
        
//        guard text.count >= K.Password.minLength else { return false }
//        let range = NSRange(location: 0, length: text.utf16.count)
//        let regex = try! NSRegularExpression(pattern: K.Password.pattern)
//        return regex.firstMatch(in: text, options: [], range: range) != nil
        return .correct
    }

    enum PasswordValidation {
        case correct
        case invalidCount
        case missingLowercase
        case missingUppercase
        case missingDigit
        case missingSpecialCharacter
    }
}

// MARK: - Constants

private enum K {
    enum Password {
        static let minLength = 8
        static let pattern = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[^A-Za-z0-9]).*$"
    }
}
