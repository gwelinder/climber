import SwiftUI
import MapKit

struct MapView: View {
    @State private var position: MapCameraPosition = .region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),  // Default to San Francisco
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    ))
    
    // Sample static routes
    let routes: [ClimbingRoute] = [
        ClimbingRoute(name: "Route 1", coordinates: [CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)])
        // ...add more routes
    ]
    
    var body: some View {
        Map(position: $position) {
            ForEach(routes) { route in
                Marker(route.name, coordinate: route.coordinates.first!)
            }
        }
    }
}

struct ClimbingRoute: Identifiable {
    let id = UUID()  // This line makes ClimbingRoute conform to Identifiable
    let name: String
    let coordinates: [CLLocationCoordinate2D]
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
