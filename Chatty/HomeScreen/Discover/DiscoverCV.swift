//
//  Copyright © Uber Technologies, Inc. All rights reserved.
//


import UIKit

class DiscoverView: UIView {
    
    var items: [DiscoverCellVM]
    
    init(items: [DiscoverCellVM]) {
        self.items = items
        super.init(frame: .zero)
        configure()
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) implement") }
    
    lazy var container: UIView = {
        .init()
    }()
    
    private func configure() {
        addSubview(container)
        container.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        container.addSubview(verticalStackView)
        verticalStackView.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        var stackV: UIStackView? = nil
        var itemC = 0
        items.forEach { item in
            if stackV == nil {
                let horizontalStackV = horizontalStackView()
                stackV = horizontalStackV
                
                let cell = DiscoverCell(vm: item)
                stackV?.addArrangedSubview(cell)
                
            } else {
                let cell = DiscoverCell(vm: item)
                stackV?.addArrangedSubview(cell)
            }
            itemC += 1
            if itemC == 2 {
                verticalStackView.addArrangedSubview(stackV!)
                itemC = 0
                stackV = nil
            }
        }
        if let stackV = stackV {
            verticalStackView.addArrangedSubview(stackV)
            addSpacer(stackV)
        }
    }
    
    lazy var verticalStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fillEqually
        return sv
    }()
    
    private func horizontalStackView() -> UIStackView {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
//        sv.alignment = .center
        return sv
    }
    
    private func addSpacer(_ sv: UIStackView) {
        sv.distribution = .fill
        
        let tv = sv.arrangedSubviews.first!
        let v1 = UIView()
        let v2 = UIView()
        sv.insertArrangedSubview(v1, at: 0)
        sv.addArrangedSubview(v2)

        v1.snp.makeConstraints { $0.size.equalTo(v2.snp.size) }
        tv.snp.makeConstraints {
            $0.width.equalTo(v1).multipliedBy(2)
        }
    }
}
