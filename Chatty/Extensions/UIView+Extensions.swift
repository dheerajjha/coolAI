//
//  Copyright © Uber Technologies, Inc. All rights reserved.
//


import UIKit

extension UIView {
    func magicAppear() {
        self.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .curveEaseOut, animations: {
            self.transform = .identity
        }, completion: nil)
    }
}
