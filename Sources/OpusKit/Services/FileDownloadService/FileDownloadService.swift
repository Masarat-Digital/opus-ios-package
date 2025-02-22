import Foundation

public class FileDownloadService {

    public var inProgress: Bool = false
    public var lastSavedFilePath: URL?

    public init() {}
}

public extension FileDownloadService {
    func savePdf(url: URL, fileName: String = "Resume", showAfterSave: Bool = false) throws {
        let pdfData = try? Data.init(contentsOf: url)
        let resourceDocPath = (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last) as URL?
        guard let resourceDocPath else { throw NSError(domain: "", code: 0, userInfo: nil) }
        let pdfNameFromUrl = "\(fileName).pdf"
        let actualPath = resourceDocPath.appendingPathComponent(pdfNameFromUrl)
        guard actualPath != lastSavedFilePath else { return }
        try pdfData?.write(to: actualPath, options: .atomic)
        lastSavedFilePath = actualPath
        if showAfterSave {
            showSavedPdf(url: actualPath, fileName: fileName)
        }
    }

    func showSavedPdf(url: URL, fileName: String) {
        do {
            let docURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let contents = try FileManager.default.contentsOfDirectory(at: docURL, includingPropertiesForKeys: [.fileResourceTypeKey], options: .skipsHiddenFiles)
            for url in contents {
                if url.description.contains("\(fileName).pdf") {}
            }
        } catch {
            print("could not locate pdf file !!!!!!!")
        }
    }

    func pdfFileAlreadySaved(url:String, fileName: String)-> Bool {
        var status = false
        if #available(iOS 10.0, *) {
            do {
                let docURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                let contents = try FileManager.default.contentsOfDirectory(at: docURL, includingPropertiesForKeys: [.fileResourceTypeKey], options: .skipsHiddenFiles)
                for url in contents {
                    if url.description.contains("YourAppName-\(fileName).pdf") {
                        status = true
                    }
                }
            } catch {
                print("could not locate pdf file !!!!!!!")
            }
        }
        return status
    }
}
