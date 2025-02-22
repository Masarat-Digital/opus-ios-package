import SwiftUI

public struct TwoVerticalEditingTextView: View {

    // MARK: - Properties

    @Binding var inputText: String
    let headerText: String
    let placeholder: String
    let keyboardType: UIKeyboardType = .default

    let headerTextComponents: TextComponents
    let textFieldComponents: TextComponents

    let strokeColorOnEdit: Color
    let strokeColorOnNormal: Color

    // MARK: - Properties (private)

    @State private var isEditing = false

    // MARK: - Initialize (public)

    public init(
        inputText: Binding<String>,
        headerText: String,
        placeholder: String,
        headerTextComponents: TextComponents,
        textFieldComponents: TextComponents,
        strokeColorOnEdit: Color,
        strokeColorOnNormal: Color,
        isEditing: Bool = false
    ) {
        self._inputText = inputText
        self.headerText = headerText
        self.placeholder = placeholder
        self.headerTextComponents = headerTextComponents
        self.textFieldComponents = textFieldComponents
        self.strokeColorOnEdit = strokeColorOnEdit
        self.strokeColorOnNormal = strokeColorOnNormal
        self.isEditing = isEditing
    }

    // MARK: - View

    public var body: some View {
        VStack(alignment: .leading, spacing: OKSpacing.normal) {
            Text(headerText)
                .apply(components: headerTextComponents)
                .keyboardType(keyboardType)

            HStack(alignment: .center) {
                TextField(
                    placeholder,
                    text: $inputText,
                    onEditingChanged: { editing in
                        self.isEditing = editing
                    }
                )
                .apply(components: textFieldComponents)
            }
            .padding(.horizontal, OKPadding.huge)
            .padding(.vertical, 0)
            .frame(maxWidth: .infinity, minHeight: K.size, maxHeight: K.size, alignment: .center)
            .background(.white)
            .cornerRadius(K.cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: 44)
                    .inset(by: 0.5)
                    .stroke(
                        isEditing
                        ? strokeColorOnEdit
                        : strokeColorOnNormal,
                        lineWidth: K.lineWidth
                    )
            )
            Divider()
                .padding(.top, 24)
        }
        .padding(0)


    }
}

// MARK: - Constants (private)

private enum K {
    static let size = CGFloat(48)
    static let cornerRadius = CGFloat(44) // TODO: JL Move it to OKRadius constant
    static let lineWidth = CGFloat(1)
}

// MARK: - Previews (private)

#if DEBUG
#Preview {
    VStack {
        TwoVerticalEditingTextView(
            inputText: .constant("text"),
            headerText: "headerText",
            placeholder: "placeholder",
            headerTextComponents: .init(font: .body, color: .black),
            textFieldComponents: .init(font: .body, color: .black),
            strokeColorOnEdit: .black,
            strokeColorOnNormal: .black
        )
    }
}
#endif
