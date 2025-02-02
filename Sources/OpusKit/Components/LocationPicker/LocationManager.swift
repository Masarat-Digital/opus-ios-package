import CoreLocation

// TODO: JL Implement LocationManager
class LocationManager : NSObject, ObservableObject{

    static let shared = LocationManager()
    private let locationManager = CLLocationManager()

    @Published var isLocationFound : Bool = false
    @Published var locationData: LocationPickerData = LocationPickerData()

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        //   locationManager.startUpdatingLocation()
    }

    func requestForLocation() {
        isLocationFound = false
        locationManager.startUpdatingLocation()
    }
}

extension LocationManager : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

//        guard let firstLocation = locations.first?.coordinate else { return }

        locationManager.stopUpdatingLocation()

        Task {
//            let fetchedLocation = await LocationUtility.convertLatLongToLocationData(latitude: firstLocation.latitude, longitude: firstLocation.longitude)
//            DispatchQueue.main.async {
//                self.locationData.coordinate = firstLocation
//                self.locationData.city = fetchedLocation?.city ?? ""
//                self.locationData.country = fetchedLocation?.country ?? ""
//
//                self.isLocationFound = true
//            }
        }
    }

}

