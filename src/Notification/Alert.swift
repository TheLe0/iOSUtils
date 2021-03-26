import UIKit

class Alert {

  class func alert(_ msg: String, viewController: UIViewController) {
    let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: UIAlertControllerStyle.alert)
    alert.addAction(UIAlertAction: "OK", style: UIAlertActionStyle.default, handler: nil))
    viewController.present(alert, animated: true, completion: nil)
  }
}
