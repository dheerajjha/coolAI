//
//  Copyright © Uber Technologies, Inc. All rights reserved.
//


import UIKit
import SnapKit
import MessageKit
import BouncyLayout
import FirebaseAnalytics

class HomeViewController: UIViewController {
    
    private let rippleButtonSize: CGFloat = appWidth(0.6)
    private let topPadding: CGFloat = 56
    private let minPadding: CGFloat = 16
    private let leftRightPadding: CGFloat = 16
    private let avatarSize: CGFloat = 56
    private lazy var rippleButtonCornerRadius: CGFloat = rippleButtonSize / 2
    
    
    lazy var avatarTitleContainerView: UIView = {
        UIView()
    }()
    
    lazy var avatarView: AvatarView = {
        let av = AvatarView()
        let avatar = Avatar(image: nil, initials: UserData.s.current.displayName)
        av.set(avatar: avatar)
        return av
    }()
    
    
    lazy var titleLabel: UILabel = {
        let l = UILabel()
        l.text = "Hi \(UserData.s.current.displayName)"
        l.font = fontBig
        return l
    }()
    
    lazy var rippleButton: ZFRippleButton = {
        let b = ZFRippleButton()
        b.trackTouchLocation = true
        b.backgroundColor = tertiaryColor
        b.rippleColor = secondaryColor
        b.rippleBackgroundColor = primaryColor
        b.layer.cornerRadius = rippleButtonCornerRadius
        b.rippleBackgroundView.layer.cornerRadius = rippleButtonCornerRadius
        b.addTarget(self, action: #selector(hit), for: .touchUpInside)
        b.magicAppear()
        return b
    }()
    
    lazy var discoveryTitleLabel: UILabel = {
        let l = UILabel()
        l.text = "Explore"
        l.font = fontBig
        return l
    }()
    
    let discoverCollectionDS = DiscoverCVDataSource()
    lazy var discoverCollectionView: UICollectionView = {
        let layout = BouncyLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(DiscoverCVCell.self, forCellWithReuseIdentifier: DiscoverCVCell.reuse)
        cv.delegate = discoverCollectionDS
        cv.dataSource = discoverCollectionDS
        return cv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
            AnalyticsParameterItemID: "id-test-analytics",
            AnalyticsParameterItemName: "testis",
            AnalyticsParameterContentType: "cont",
        ])
        
        Analytics.logEvent("sample_event", parameters: nil)
    }
    
    private func setupConstraints() {
        view.addSubview(avatarTitleContainerView)
        avatarTitleContainerView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(topPadding)
            make.left.right.equalToSuperview().inset(leftRightPadding)
        }
        
        avatarTitleContainerView.addSubview(avatarView)
        avatarView.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview()
            make.width.equalTo(avatarView.snp.height)
            make.height.equalTo(avatarSize)
        }
        
        avatarTitleContainerView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.bottom.right.equalToSuperview()
            make.left.equalTo(avatarView.snp.right).inset(-minPadding)
        }
        
        view.addSubview(rippleButton)
        rippleButton.snp.makeConstraints { make in
            make.top.equalTo(avatarTitleContainerView.snp.bottom).inset(-topPadding)
            make.width.height.equalTo(rippleButtonSize)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(discoveryTitleLabel)
        discoveryTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(rippleButton.snp.bottom).inset(-topPadding)
            make.left.right.equalToSuperview().inset(leftRightPadding)
        }
        
        view.addSubview(discoverCollectionView)
        discoverCollectionView.snp.makeConstraints { make in
            make.top.equalTo(discoveryTitleLabel.snp.bottom).inset(-minPadding)
            make.left.right.equalToSuperview().inset(leftRightPadding)
            make.bottom.equalToSuperview()
        }
        
    }
    
    
    @objc
    private func hit() {
        let vc = BasicExampleViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}

