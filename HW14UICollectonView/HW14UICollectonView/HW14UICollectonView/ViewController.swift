//
//  ViewController.swift
//  HW14UICollectonView
//
//  Created by Вячеслав Башур on 03/08/2024.
//

import UIKit

class ImageUICollectionViewCell:UICollectionViewCell{
    lazy var imageView: UIImageView = .init()
    lazy var label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupLayout()
    }
    init(){
        super.init(frame: .zero)
        setupLayout()
    }
    
    private func setupLayout() {
        contentView.addSubview(imageView)
        contentView.addSubview(label)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: label.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
        ])
    }
    
    func setup(image: UIImage) {
        imageView.image = image
        label.text = "Знак"
        label.textAlignment = .center
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ViewController: UIViewController {
    lazy var collectionView = UICollectionView(frame: view.frame, collectionViewLayout: .init())
    
    //    lazy var directImage: [String: UIImage?] =
    //        "plus" : UIImage(systemName: "plus",
    //        "percent" : UIImage(systemName: "percent"),
    //        "minus" : UIImage(systemName: "minus"),
    //        "plusminus" : UIImage(systemName: "plusminus"),
    //        "divide" : UIImage(systemName: "divide"),
    //        "multiply" : UIImage(systemName: "multiply")
    
    let identifire = "Image"
   lazy var images: [[UIImage?]] = .init(repeating: [UIImage(systemName: "plus"),
                                                 UIImage(systemName: "percent"),
                                                 UIImage(systemName: "minus"),
                                                 UIImage(systemName: "plusminus"),
                                                 UIImage(systemName: "divide"),
                                                 UIImage(systemName: "multiply")
                                            ], count: 100)
    lazy var unwarpImages: [UIImage] = images.flatMap{$0}.compactMap{$0}
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.register(ImageUICollectionViewCell.self, forCellWithReuseIdentifier: identifire)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let layout = UICollectionViewFlowLayout()
        let itemInRow:CGFloat = 3
        let spacing: CGFloat = 6
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        let screenWidth = UIScreen.main.bounds.width - (spacing * 4)
        let widthItem = screenWidth / itemInRow
        layout.itemSize = .init(
            width: widthItem,
            height: widthItem
        )
        collectionView.collectionViewLayout = layout
        collectionView.contentInset = .init(
            top: spacing ,
            left: spacing ,
            bottom: spacing,
            right: spacing
        )
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifire, for: indexPath) as? ImageUICollectionViewCell
        cell?.setup(image: unwarpImages[indexPath.item])
        
        return cell ?? UICollectionViewCell()
    }
    
    
}
