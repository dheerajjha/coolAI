//
//  Copyright © Uber Technologies, Inc. All rights reserved.
//


import UIKit

func appWidth(_ percentage: CGFloat = 1) -> CGFloat {
    UIScreen.main.bounds.width * percentage
}

func appHeight(_ percentage: CGFloat = 1) -> CGFloat {
    UIScreen.main.bounds.height * percentage
}
