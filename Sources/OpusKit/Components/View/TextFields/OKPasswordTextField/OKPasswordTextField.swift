import SwiftUI

public struct OKPasswordTextField: View {

    // MARK: - Properties

    let assets: OKPasswordTextField.Assets
    let warningText: String?
    let shouldShowWarning: Bool

    @Binding var text: String

    // MARK: - Properties (private)

    @FocusState private var isFocused
    @State private var isPasswordVisible: Bool

    private var icon: Image? {
        isPasswordVisible ? assets.hideIcon : assets.showIcon
    }

    private var currentTheme: Color {
        if shouldShowWarning {
            return assets.warningColor
        } else if isFocused {
            return assets.strokeEditColor
        } else {
            return assets.strokeDefaultColor
        }
    }

    // MARK: - Initialize

    public init(
        text: Binding<String>,
        assets: OKPasswordTextField.Assets,
        warningText: String? = nil,
        shouldShowWarning: Bool = false,
        isPasswordVisible: Bool = false
    ) {
        self._text = text
        self.assets = assets
        self.warningText = warningText
        self.shouldShowWarning = shouldShowWarning
        self.isPasswordVisible = isPasswordVisible
    }

    // MARK: - View

    public var body: some View {
        VStack {
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
                    .stroke(currentTheme, lineWidth: 1)
            )
            if let warningText, warningText.isEmpty.isFalse, shouldShowWarning {
                Text(warningText)
                    .apply(font: assets.font, color: assets.warningColor)
                    .multilineTextAlignment(.center)
            }
        }
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
        let warningColor: Color

        public init(
            placeholder: String,
            showIcon: Image?,
            hideIcon: Image?,
            font: Font,
            color: Color,
            iconColor: Color,
            strokeEditColor: Color,
            strokeDefaultColor: Color,
            warningColor: Color
        ) {
            self.placeholder = placeholder
            self.showIcon = showIcon
            self.hideIcon = hideIcon
            self.font = font
            self.color = color
            self.iconColor = iconColor
            self.strokeEditColor = strokeEditColor
            self.strokeDefaultColor = strokeDefaultColor
            self.warningColor = warningColor
        }
    }
}
