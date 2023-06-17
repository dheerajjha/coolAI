import UIKit

class CustomCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private var dataset: [(label: String, image: UIImage)] = []
    
    init(frame: CGRect) {
        let layout = UICollectionViewFlowLayout()
        super.init(frame: frame, collectionViewLayout: layout)
        
        self.dataSource = self
        self.delegate = self
        
        // Register your custom cell class
        self.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        // Configure the collection view appearance
        self.backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Method to set the dataset for the collection view
    func setDataset(_ dataset: [(label: String, image: UIImage)]) {
        self.dataset = dataset
        self.reloadData()
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataset.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCollectionViewCell
        
        let data = dataset[indexPath.item]
        cell.configure(with: data.label, image: data.image)
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Adjust the cell size based on your requirements
        return CGSize(width: 100, height: 120)
    }
    
    // You can customize other layout attributes using UICollectionViewDelegateFlowLayout methods as needed
    
}
