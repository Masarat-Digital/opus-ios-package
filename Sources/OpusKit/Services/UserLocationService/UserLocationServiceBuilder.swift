import Foundation

public enum UserLocationServiceBuilder {
    public static func make() -> UserLocationServiceProtocol {
        return UserLocationService()
    }
}
