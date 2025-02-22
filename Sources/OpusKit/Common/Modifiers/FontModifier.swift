import Foundation
import SwiftUI

// TODO: JL Implement with custom fonts from spm
struct FontOutfitTestModifier: ViewModifier {
    var fontSize: CGFloat
    func body(content: Content) -> some View {
        content
            .font(.headline)
    }
}
