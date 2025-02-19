import Foundation
import MapKit

public enum OKConstant {}

// MARK: - Map

public extension OKConstant {
    enum Map {
        /// Saudi Arabia coordinates
        static let defaultRegion = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 23.95, longitude: 45.29),
            span: MKCoordinateSpan(latitudeDelta: 15, longitudeDelta: 15)
        )
    }
}
