import SwiftUI

func applyModifier(to text: Text, using modifier: ((Text) -> AnyView)?) -> AnyView {
    if let modifier = modifier {
        return modifier(text)
    } else {
        return AnyView(text)
    }
}
