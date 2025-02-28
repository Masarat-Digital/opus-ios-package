import Foundation

public protocol FileDownloadServiceProtocol: NSObject {
    func downloadAndSavePDFFile(url: URL, fileName: String) async throws
}
