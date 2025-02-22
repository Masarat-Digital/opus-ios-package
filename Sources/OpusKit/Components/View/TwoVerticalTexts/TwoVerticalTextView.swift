import SwiftUI

public struct TwoVerticalTextView: View {
    let title: String
    let details: String
    let titleFont: Font
    let detailsFont: Font
    let titleColor: Color
    let detailsColor: Color

    public init(
        title: String,
        details: String,
        titleFont: Font,
        detailsFont: Font,
        titleColor: Color = .black,
        detailsColor: Color = .black
    ) {
        self.title = title
        self.details = details
        self.titleFont = titleFont
        self.detailsFont = detailsFont
        self.titleColor = titleColor
        self.detailsColor = detailsColor
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: OKSpacing.small) {
            Text(title)
                .apply(font: titleFont, color: titleColor)

            Text(details)
                .apply(font: detailsFont, color: detailsColor)

            Divider().padding(.top, OKPadding.huge)
        }
        .padding(.zero)
    }
}

// MARK: - Previews (private)

#Preview {
    VStack {
        TwoVerticalTextView(title: "title", details: "details", titleFont: .body, detailsFont: .caption)
    }
}
