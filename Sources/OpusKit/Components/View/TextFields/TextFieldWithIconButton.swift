import SwiftUI

// TODO: JL Implement custom fonts
struct TextFieldWithIconButton: View {
    let placeholder: String
    @Binding var text: String

    let icon: Image
    var buttonAction: () -> Void
    var iconAction: () -> Void

    var body: some View {
        HStack {
            Button(
                action: buttonAction
            ) {
                TextField(placeholder, text: $text)
//                    .modifier(FontOutfitMedium(fontSize: 14))
//                    .foregroundColor(Constants.ColorAsset.textColor)
                    .disabled(true)
                    .multilineTextAlignment(.leading)
            }

            Button(
                action: iconAction
            ) {
                icon
//                    .foregroundColor(Constants.ColorAsset.descriptionText)
//                    .accentColor(Constants.ColorAsset.descriptionText)
            }
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 0)
        .frame(maxWidth: .infinity, maxHeight: 48, alignment: .leading)
        .frame(height: 48)
        .background(.white)
        .cornerRadius(44)
//        .modifier(DefaultRoundedRectangleOverlay())
    }
}
