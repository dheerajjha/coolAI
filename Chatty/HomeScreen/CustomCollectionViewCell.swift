import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    private var label: UILabel!
    private var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Configure cell appearance
        backgroundColor = UIColor.lightGray
        
        // Create and configure label
        label = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: 20))
        label.textAlignment = .center
        label.textColor = UIColor.black
        addSubview(label)
        
        // Create and configure image view
        imageView = UIImageView(frame: CGRect(x: 0, y: 20, width: frame.width, height: frame.height - 20))
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with labelText: String, image: UIImage) {
        label.text = labelText
        imageView.image = image
    }
    
}
