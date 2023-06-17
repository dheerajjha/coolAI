//
//  Copyright © Uber Technologies, Inc. All rights reserved.
//


import UIKit
import Kingfisher

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
        l.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        return l
    }()
    
    lazy var descriptionLabel: UILabel = {
        let l = UILabel()
        l.text = vm.description
        l.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        return l
    }()
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        let url = URL(string: "https://blog.snappa.com/wp-content/uploads/2020/01/WP-header-image-size-1024x536.jpg")
        iv.kf.indicatorType = .activity
        iv.kf.setImage(
            with: url,
            placeholder: UIImage(named: "placeholderImage"),
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        iv.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        iv.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        return iv
    }()
    
    init(vm: DiscoverCellVM) {
        self.vm = vm
        super.init(frame: .zero)
        setupConfiguration()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        self.addGestureRecognizer(tapGesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConfiguration() {
        addSubview(containerV)
        containerV.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(8)
            $0.height.equalTo(200)
        }
        
        containerV.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.top.right.equalToSuperview()
            $0.width.equalTo(imageView.snp.height)
            $0.height.equalTo(appWidth(0.2))
            $0.bottom.lessThanOrEqualToSuperview()
        }
        
        containerV.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.left.equalToSuperview()
            $0.right.equalTo(imageView.snp.left).inset(-8)
        }
        
        containerV.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).inset(-8)
            $0.left.equalToSuperview()
            $0.right.equalTo(titleLabel.snp.right)
        }
    }
    
    @objc func tapped() {
        let vc = BasicExampleViewController()
        vc.promptSetMessage = vm._prompt
        (window?.rootViewController as? UINavigationController)?.pushViewController(vc, animated: true)
    }
}
