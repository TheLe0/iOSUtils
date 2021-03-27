import UIKit

public class UserUtil: UserDefaults {

    public static func saveFirstAcess(storyboardIdentifier: String, window: inout UIWindow){
        
        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
        
        if !launchedBefore {
            window.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: storyboardIdentifier)
            UserDefaults.standard.set(true, forKey: "launchedBefore")
        }
    }
    
}
