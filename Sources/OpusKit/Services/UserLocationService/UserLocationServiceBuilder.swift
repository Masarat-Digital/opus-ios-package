import Foundation

public enum UserLocationServiceBuilder {
    static func make() -> UserLocationServiceProtocol {
        return UserLocationService()
    }
}
