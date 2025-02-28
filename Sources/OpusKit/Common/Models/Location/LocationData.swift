import Foundation
import MapKit

public struct LocationData: Identifiable, Sendable, Equatable {
    public var id: UUID
    public var address: String
    public var street: String
    public var city: String
    public var country: String
    public var coordinate: CLLocationCoordinate2D?

    public init(
        id: UUID = .init(),
        address: String = "",
        street: String = "",
        city: String = "",
        country: String = "",
        coordinate: CLLocationCoordinate2D? = nil
    ) {
        self.id = id
        self.address = address
        self.street = street
        self.city = city
        self.country = country
        self.coordinate = coordinate
    }
}

// MARK: - Equatable

extension LocationData {
    public static func == (lhs: LocationData, rhs: LocationData) -> Bool {
        return lhs.id == rhs.id &&
        lhs.address == rhs.address &&
        lhs.street == rhs.street &&
        lhs.city == rhs.city &&
        lhs.country == rhs.country &&
        lhs.coordinate?.latitude == rhs.coordinate?.latitude &&
        lhs.coordinate?.longitude == rhs.coordinate?.longitude
    }
}

// MARK: - Title (public)

public extension LocationData {
     var title: String {
        var street = self.street
        if
            street.filter({!$0.isWhitespace}).count == .zero,
            address.isEmpty == false
        {
            street = address
        }
        return [street, city, country]
            .compactMap {
                $0.isEmpty ? nil : $0
            }
            .joined(separator: ", ")
    }
}
