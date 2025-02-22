import SwiftUI
import PDFKit

public struct OKFileView: View {

    let url: URL?

    public init(
        url: URL? = URL(string: "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf")
    ) {
        self.url = url
    }

    public var body: some View {
        if let url {
            PDFKitView(url: url)
        } else {
            Text("Couldn't load")
        }
    }
}

// MARK: - Preview

#if DEBUG
#Preview {
    OKFileView()
}
#endif


