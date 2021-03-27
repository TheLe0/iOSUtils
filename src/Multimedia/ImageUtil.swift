import Foundation

public class ImageUtil: NSObject {

    public static func create(x: Double, y: Double, width: Double, height: Double, image: UIImage, contentMode: UIViewContentMode ) -> UIImageView{
        
        let view = UIImageView.init(frame: CGRect(x: x, y: y, width: width, height: height))
        view.image = image
        view.contentMode = contentMode
        
        return view
        
    }
    
    public static func createWithAction(x: Double, y: Double, width: Double, height: Double, image: UIImage, contentMode: UIViewContentMode, selector: Selector) -> UIImageView{
        
        let view = UIImageView.init(frame: CGRect(x: x, y: y, width: width, height: height))
        view.image = image
        view.contentMode = contentMode
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: selector))
        
        return view

    }
}
