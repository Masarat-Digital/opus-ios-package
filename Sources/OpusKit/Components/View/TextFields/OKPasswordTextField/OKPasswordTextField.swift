import SwiftUI

public struct OKPasswordTextField: View {

    // MARK: - Properties

    let assets: OKPasswordTextField.Assets

    @Binding var text: String

    var validator: (String) -> Bool

    // MARK: - Properties (private)

    @FocusState private var isFocused
    @State private var isPasswordVisible: Bool

    private var icon: Image? {
        isPasswordVisible ? assets.hideIcon : assets.showIcon
    }

    // MARK: - Initialize

    public init(
        text: Binding<String>,
        assets: OKPasswordTextField.Assets,
        isPasswordVisible: Bool = false,
        validator: @escaping (String) -> Bool
    ) {
        self._text = text
        self.assets = assets
        self.isPasswordVisible = isPasswordVisible
        self.validator = validator
    }

    // MARK: - View

    public var body: some View {
        HStack {
            if isPasswordVisible {
                TextField(assets.placeholder, text: $text)
                    .apply(font: assets.font, color: assets.color)
                    .focused($isFocused)
            } else {
                SecureField(assets.placeholder, text: $text)
                    .apply(font: assets.font, color: .black)
                    .focused($isFocused)
            }
            if
                let showIcon = assets.showIcon,
                let hideIcon = assets.hideIcon
            {
                Button(
                    action: {
                        isPasswordVisible.toggle()
                    }
                ) {
                    icon
                        .accentColor(assets.iconColor)
                }
                .padding(.trailing, 10)
            }
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 0)
        .frame(maxWidth: .infinity, maxHeight: 48, alignment: .leading)
        .frame(height: 48)
        .background(.white)
        .cornerRadius(44)
        .overlay(
            RoundedRectangle(cornerRadius: 44)
                .inset(by: 0.5)
                .stroke(isFocused ? assets.strokeEditColor : assets.strokeDefaultColor, lineWidth: 1)
        )
    }
}

// MARK: - Assets

extension OKPasswordTextField {
    public struct Assets: Equatable {
        let placeholder: String
        let showIcon: Image?
        let hideIcon: Image?
        let font: Font
        let color: Color
        let iconColor: Color
        let strokeEditColor: Color
        let strokeDefaultColor: Color
        let warningText: String?
        let warningColor: Color?

        public init(
            placeholder: String,
            showIcon: Image?,
            hideIcon: Image?,
            font: Font,
            color: Color,
            iconColor: Color,
            strokeEditColor: Color,
            strokeDefaultColor: Color,
            warningText: String? = nil,
            warningColor: Color? = nil
        ) {
            self.placeholder = placeholder
            self.showIcon = showIcon
            self.hideIcon = hideIcon
            self.font = font
            self.color = color
            self.iconColor = iconColor
            self.strokeEditColor = strokeEditColor
            self.strokeDefaultColor = strokeDefaultColor
            self.warningText = warningText
            self.warningColor = warningColor
        }
    }
}
