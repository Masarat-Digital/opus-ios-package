import SwiftUI

public extension SecureField {
    func apply(font: Font, color: Color) -> some View {
        self
            .font(font)
            .foregroundColor(color)
    }
    
    func apply(components: TextComponents) -> some View {
        self
            .font(components.font)
            .foregroundColor(components.color)
    }
}
