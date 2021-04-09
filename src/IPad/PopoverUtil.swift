import Foundation

class PopoverUtil {

  class func show(_ vcSelf: UIViewController, viewController: UIViewController, sourceView: UIView, width: CGFloat,height: CGFloat) {
    let vc = viewController
    vc.preferredContentSize = CGSize(width: width, height: height)
    vc.modalPresentationStyle = UIModalPresentationStyle.popover
    
    let popoverPresentationController = vc.popoverPresentationController
    popoverPresentationController?.sourceView = sourceView
    
    vcSelf.present(vc, animated: true, completion: nil)
 
  }
  
  class func show(_ vcSelf: UIViewController, viewController: UIViewController, source: UIBarButtonItem, width: CGFloat,height: CGFloat) {
    let vc = viewController
    vc.preferredContentSize = CGSize(width: width, height: height)
    vc.modalPresentationStyle = UIModalPresentationStyle.popover
    
    let popoverPresentationController = vc.popoverPresentationController
    popoverPresentationController?.barButtonItem = source
    
    cSelf.present(vc, animated: true, completion: nil)
    
  }
}
