import CoreLocation

extension CLLocationDistance {
    public func inMiles() -> Double {
        return self * 0.00062137
    }

    public func inKilometers() -> Double {
        return self/1000
    }
}
