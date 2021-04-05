import UIKit
import MapKit

class MapViewController : UIViewController {
  let locManager = CLLocationManager()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    locManager.requestWhenInUseAuthorization()
  }
  
}
