//import UIKit
//
//public class FileDownloadService: NSObject {
//
//    private var continuation: CheckedContinuation<Void, Error>?
//
//    public override init() {
//        super.init()
//    }
//}
//
//extension FileDownloadService: FileDownloadServiceProtocol {
//    public func downloadAndSaveFile(url: URL, fileName: String) async throws {
//        return try await withCheckedThrowingContinuation { continuation in
//            let (fileURL, _) = try await URLSession.shared.download(from: url)
//            let data = try Data(contentsOf: fileURL)
//            let tempUrl = FileManager.default.temporaryDirectory.appendingPathComponent(fileName)
//            try data.write(to: tempUrl) /// save temporary data
//            async let pathPicker = UIDocumentPickerViewController(forExporting: [tempUrl])
//            await pathPicker.delegate = self
//            if let topVC = UIApplication.shared.connectedScenes
//                .compactMap({ $0 as? UIWindowScene })
//                .first?.windows.first(where: { $0.isKeyWindow })?.rootViewController {
//                await topVC.present(pathPicker, animated: true, completion: nil)
//            }
//        }
//    }
//}
//
//extension FileDownloadService: UIDocumentPickerDelegate {
//    public func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
//        continuation?.resume(returning: Void())
//        continuation = nil
//    }
//
//    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
//        continuation?.resume(returning: Void())
//        continuation = nil
//    }
//}

import UIKit

public class FileDownloaderService: NSObject {
    private var continuation: CheckedContinuation<Void, Error>?

    public override init() {
        super.init()
    }
}

extension FileDownloaderService: FileDownloadServiceProtocol {
    public func downloadAndSaveFile(url: URL, fileName: String) async throws {
        let (fileURL, _) = try await URLSession.shared.download(from: url)
        let data = try Data(contentsOf: fileURL)
        let tempUrl = FileManager.default.temporaryDirectory.appendingPathComponent(fileName)
        try data.write(to: tempUrl)

        try await withCheckedThrowingContinuation { continuation in
            self.continuation = continuation
            let documentPicker = UIDocumentPickerViewController(forExporting: [tempUrl])
            documentPicker.delegate = self

            if let topVC = UIApplication.shared.connectedScenes
                .compactMap({ $0 as? UIWindowScene })
                .first?.windows.first(where: { $0.isKeyWindow })?.rootViewController {
                DispatchQueue.main.async {
                    topVC.present(documentPicker, animated: true, completion: nil)
                }
            } else {
                continuation.resume(throwing: NSError(domain: "FileDownloadError", code: 1001, userInfo: [NSLocalizedDescriptionKey: "Failed to find top view controller"]))
            }
        }
    }
}

extension FileDownloaderService: UIDocumentPickerDelegate {
    public func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        continuation?.resume(throwing: NSError(domain: "FileDownloadError", code: 1002, userInfo: [NSLocalizedDescriptionKey: "User cancelled the operation"]))
        continuation = nil
    }

    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        continuation?.resume()
        continuation = nil
    }
}

