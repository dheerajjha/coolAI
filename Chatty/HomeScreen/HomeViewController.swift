//
//  Copyright © Uber Technologies, Inc. All rights reserved.
//


import UIKit
import SnapKit
import MessageKit
import FirebaseAnalytics

class HomeViewController: UIViewController {
    
    private let topPadding: CGFloat = 16
    private let minPadding: CGFloat = 16
    private let leftRightPadding: CGFloat = 16
    private let avatarSize: CGFloat = 56
    
    lazy var containerView: UIView = {
        let scrollV = UIScrollView()
        view.addSubview(scrollV)
        scrollV.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        let cv = UIView()
        scrollV.addSubview(cv)
        cv.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(appWidth())
            $0.height.equalTo(appHeight())
        }
        return cv
    }()
    
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
        l.numberOfLines = 0
        l.font = fontBig
        return l
    }()
    
    lazy var rippleButton: ZFRippleButton = {
        let b = RippleButton()
        b.buttonTap = hit
        return b
    }()
    
    lazy var discoveryTitleLabel: UILabel = {
        let l = UILabel()
        l.text = "Explore"
        l.font = fontBig
        return l
    }()
    
    lazy var discoverContainerView: UIView = {
        let v = UIView()
        v.backgroundColor = .yellow
        return v
    }()
    
    lazy var discoverView: DiscoverView = {
        let v = DiscoverView(items: [
            .init(title: "title", description: "des", imageLink: "https://blog.snappa.com/wp-content/uploads/2020/08/cropped-profile-icon-image_1200x1200-2-32x32.png", _prompt: "Assume you are a product manager. "),
            
                .init(title: "title", description: "des", imageLink: "https://blog.snappa.com/wp-content/uploads/2020/08/cropped-profile-icon-image_1200x1200-2-32x32.png", _prompt: "Assume you are a product manager. "),
            
                .init(title: "title", description: "des", imageLink: "https://blog.snappa.com/wp-content/uploads/2020/08/cropped-profile-icon-image_1200x1200-2-32x32.png", _prompt: "Assume you are a product manager. "),
            
                .init(title: "title", description: "des", imageLink: "https://blog.snappa.com/wp-content/uploads/2020/08/cropped-profile-icon-image_1200x1200-2-32x32.png", _prompt: "Assume you are a product manager. "),
            
                .init(title: "title", description: "des", imageLink: "https://blog.snappa.com/wp-content/uploads/2020/08/cropped-profile-icon-image_1200x1200-2-32x32.png", _prompt: "Assume you are a product manager. "),
            
            
                .init(title: "title", description: "des", imageLink: "https://blog.snappa.com/wp-content/uploads/2020/08/cropped-profile-icon-image_1200x1200-2-32x32.png", _prompt: "Assume you are a product manager. "),
            
                .init(title: "title", description: "des", imageLink: "https://blog.snappa.com/wp-content/uploads/2020/08/cropped-profile-icon-image_1200x1200-2-32x32.png", _prompt: "Assume you are a product manager. "),
            
                .init(title: "title", description: "des", imageLink: "https://blog.snappa.com/wp-content/uploads/2020/08/cropped-profile-icon-image_1200x1200-2-32x32.png", _prompt: "Assume you are a product manager. "),
            
                .init(title: "title", description: "des", imageLink: "https://blog.snappa.com/wp-content/uploads/2020/08/cropped-profile-icon-image_1200x1200-2-32x32.png", _prompt: "Assume you are a product manager. "),
            
            
                .init(title: "title", description: "des", imageLink: "https://blog.snappa.com/wp-content/uploads/2020/08/cropped-profile-icon-image_1200x1200-2-32x32.png", _prompt: "Assume you are a product manager. "),
            
                .init(title: "title", description: "des", imageLink: "https://blog.snappa.com/wp-content/uploads/2020/08/cropped-profile-icon-image_1200x1200-2-32x32.png", _prompt: "Assume you are a product manager. "),
            
                .init(title: "title", description: "des", imageLink: "https://blog.snappa.com/wp-content/uploads/2020/08/cropped-profile-icon-image_1200x1200-2-32x32.png", _prompt: "Assume you are a product manager. "),
            
                .init(title: "title", description: "des", imageLink: "https://blog.snappa.com/wp-content/uploads/2020/08/cropped-profile-icon-image_1200x1200-2-32x32.png", _prompt: "Assume you are a product manager. "),
            
                
                .init(title: "title", description: "des", imageLink: "https://blog.snappa.com/wp-content/uploads/2020/08/cropped-profile-icon-image_1200x1200-2-32x32.png", _prompt: "Assume you are a product manager. ")
        ])
        return v
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
        
        
        let urlReq = URLRequest(url: URL(string: "https://useless.com")!)
        URLSession.shared.dataTask(with: urlReq) {
            data, _, _ in
            print("call done")
        }.resume()
    }
    
    private func setupConstraints() {
        containerView.addSubview(avatarTitleContainerView)
        avatarTitleContainerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
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
        
        containerView.addSubview(rippleButton)
        rippleButton.snp.makeConstraints { make in
            make.top.equalTo(avatarTitleContainerView.snp.bottom).inset(-topPadding)
            make.width.height.equalTo(RippleButton.rippleButtonSize)
            make.centerX.equalToSuperview()
        }
        
        containerView.addSubview(discoveryTitleLabel)
        discoveryTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(rippleButton.snp.bottom).inset(-topPadding)
            make.left.right.equalToSuperview().inset(leftRightPadding)
        }
        
        containerView.addSubview(discoverContainerView)
        discoverContainerView.snp.makeConstraints { make in
            make.top.equalTo(discoveryTitleLabel.snp.bottom).inset(-minPadding)
            make.left.right.equalToSuperview().inset(leftRightPadding)
            make.bottom.equalToSuperview()
        }
        
        discoverContainerView.addSubview(discoverView)
        discoverView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    private func hit() {
        let vc = BasicExampleViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}

