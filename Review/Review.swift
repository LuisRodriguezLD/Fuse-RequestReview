import Foundation
import StoreKit

@available(iOS 10.3, *)
public class Review: NSObject {
    public func requestReview(){
        SKStoreReviewController.requestReview()
    }
}
