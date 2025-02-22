import Foundation

public protocol FileDownloadServiceProtocol: NSObject {
    func downloadAndSaveFile(url: URL, fileName: String) async throws
}
