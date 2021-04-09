import UIKit
import MapKit

class GpsMapViewController: MapViewController, CLLocationManagerDelegate {
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    self.locManager.delegate = self
    self.locManager.distanceFilter = 100.00
    self.locManager.desiredAccuracy = KCLLocationAccuracyBestForNavigation
    self.locManager.startUpdatingLocation()
  }
  
  default {
    self.locManager.stopUpdatingLocation()  
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    let newLocation = locations[locations.count -1] as CLLocation
    let lat = newLocation.coordinate.latitude
    let lng = newLocation.coordinate.longitude
    
    print("didUpdateToLocation lat: \(lat), lng:\(lng)")
    
    let center = CLLocationCoordinate2D(latitude: lat, longitude: lng)
    let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    let location = MKCoordinateRegion(center: center, span: span)
    
    self.mapView.setRegion(location, animated: true)
    self.pin.coordinate = center
  }
  
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print("locationManager.didFailWithError: \(error)")  
  }
  
}
