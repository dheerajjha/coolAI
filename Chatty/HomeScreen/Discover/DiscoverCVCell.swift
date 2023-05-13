//
//  Copyright © Uber Technologies, Inc. All rights reserved.
//


import UIKit

struct DiscoverCellVM {
    let title: String
    let description: String
    let imageLink: String
    let _prompt: String
}

class DiscoverCell: UIView {
    
    let vm: DiscoverCellVM
    
    lazy var containerV: UIView = {
        .init()
    }()
    
    lazy var titleLabel: UILabel = {
        let l = UILabel()
        l.text = vm.title
        return l
    }()
    
    lazy var descriptionLabel: UILabel = {
        let l = UILabel()
        l.text = vm.description
        return l
    }()
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        let url = URL(string: vm.imageLink)
        iv.kf.setImage(with: url)
        return iv
    }()
    
    init(vm: DiscoverCellVM) {
        self.vm = vm
        super.init(frame: .zero)
        setupConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConfiguration() {
        addSubview(containerV)
        containerV.snp.makeConstraints { $0.edges.equalToSuperview().inset(8) }
        
        containerV.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
        }
        
        containerV.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).inset(-8)
            $0.bottom.left.right.equalToSuperview()
        }
    }
}
