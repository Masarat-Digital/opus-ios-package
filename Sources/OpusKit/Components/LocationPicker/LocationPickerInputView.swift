import SwiftUI
import MapKit


// TODO: JL Implement LocationPickerInputView with all dependencies.

//public struct LocationPickerInputView: View {
//
//    let placeholder: String
//
//    @Binding var pickedLocationData: LocationPickerData
//
//    // MARK: - Properties (private)
//
//    @ObservedObject private var locationManager = LocationManager.shared
//
//    @State private var showSheet = false
//    @State private var text: String = ""
//    @State private var searchedText: String = ""
//    @State private var annotationItems: [LocationPickerData] = []
//
//    public var body: some View {
//        HStack {
//            TextFieldWithIconButton(
//                placeholder: placeholder,
//                text: $text,
//                icon: Image(K.icon),
//                buttonAction: {
//                    showSheet = true
//                },
//                iconAction: {
//                    setUserLocation()
//                }
//            )
//        }
//        .sheet(isPresented: $showSheet) {
//            VStack(alignment: .center, spacing: .zero) {
//                Capsule(style: .continuous)
//                    .fill(.black.opacity(0.5))
//                    .frame(width: K.Divider.width, height: K.Divider.height)
//                    .padding(.top, 12)
//
//                MapLocationPickerView(
//                    placeholder: placeholder,
//                    annotationItems: $annotationItems,
//                    searchedText: $searchedText,
//                    userLocation: $locationManager.locationData
//                )
//            }
//            .background(Constants.ColorAsset.background)
//        }
//        .onChange(of: annotationItems) { result in
//            onSearchResultChange(result)
//        }
//        .onChange(of: searchedText) { result in
//            onSearchResultChange(result)
//        }
//        .onChange(of: locationManager.locationData) { result in
//            guard result.coordinate != nil else { return }
//            onUserLocationChange(result)
//        }
//        .onAppear {
//            onAppear()
//        }
//    }
//}
//
//@MainActor
//extension MapLocationPickerFormView {
//    private func onSearchResultChange(_ results: [LocationPickerData]) {
//        guard let result = results.first else { return }
//        pickedLocationData = result
//    }
//
//    private func onSearchResultChange(_ result: String) {
//        text = result
//        if result.isEmpty {
//            pickedLocationData = LocationPickerData()
//        } else {
//            guard let location = annotationItems.first else { return }
//            pickedLocationData = location
//        }
//    }
//
//    private func onUserLocationChange(_ result: LocationPickerData) {
//        annotationItems = [result]
//    }
//
//    private func onAppear() {
//        loadUserLocationIfNeeded()
//    }
//
//    private func loadUserLocationIfNeeded() {
//        guard text.isEmpty else { return }
//        locationManager.requestForLocation()
//    }
//
//    private func setUserLocation() {
//        guard locationManager.locationData.coordinate != nil else { return }
//        pickedLocationData =  locationManager.locationData
//        text =  locationManager.locationData.title
//    }
//}
//
//// MARK: - Constants
//
//private enum K {
//    static let icon: String = Constants.Images.location
//
//    enum Divider {
//        static let width: CGFloat = 50
//        static let height: CGFloat = 3
//    }
//}
