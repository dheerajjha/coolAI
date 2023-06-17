import UIKit

class RippleButton: ZFRippleButton {
    
    static let rippleButtonSize: CGFloat = appWidth(0.6)
    static let rippleButtonCornerRadius: CGFloat = rippleButtonSize / 2
    
    var buttonTap: (() -> Void)?
    
    init() {
        super.init(frame: .zero)
        trackTouchLocation = true
        backgroundColor = tertiaryColor
        rippleColor = secondaryColor
        rippleBackgroundColor = primaryColor
        layer.cornerRadius = Self.rippleButtonCornerRadius
        rippleBackgroundView.layer.cornerRadius = Self.rippleButtonCornerRadius
        addTarget(self, action: #selector(hit), for: .touchUpInside)
        magicAppear()
        addSubviews()
        addConstraints()
    }
    
    lazy var descriptionLabel: UILabel = {
        let l = UILabel()
        l.text = "hello buddy"
        return l
    }()
    
    lazy var descriptionImageView: UIImageView = {
        let imageView = UIImageView(image: .add)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    func addSubviews() {
        addSubview(descriptionLabel)
        addSubview(descriptionImageView)
    }
    
    func addConstraints() {
        descriptionLabel.snp.makeConstraints { make in
            make.center.equalTo(self)
        }
        
        descriptionImageView.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(16)
            make.width.height.equalTo(100)
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func hit() {
        buttonTap?()
    }
}
