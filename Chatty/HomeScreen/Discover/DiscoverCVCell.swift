//
//  Copyright © Uber Technologies, Inc. All rights reserved.
//


import UIKit

class DiscoverCVCell: UICollectionViewCell {
    
    static let reuse = #file
    
    lazy var actionButton: ZFRippleButton = {
        let b = ZFRippleButton()
        b.setTitle("honey is cute", for: .normal)
        b.backgroundColor = .green
        return b
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConfiguration() {
        self.addSubview(actionButton)
        actionButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
