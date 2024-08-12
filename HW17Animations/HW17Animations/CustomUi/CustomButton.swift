import UIKit

class CustomButton: UIButton {
    enum Style {
        case left
        case right
        case up
        case down
    }
    enum iconBut{
        static let left = UIImage(systemName: "arrowshape.left.fill")
        static let right = UIImage(systemName: "arrowshape.right.fill")
        static let up = UIImage(systemName: "arrowshape.up.fill")
        static let down = UIImage(systemName: "arrowshape.down.fill")
    }
    private let cornRad: CGFloat
    private let bordWidth: CGFloat
    
    init(
        style: Style,
        cornRad: CGFloat,
        bordWidth: CGFloat
    ) {
        self.cornRad = cornRad
        self.bordWidth = bordWidth
        super.init(frame: .zero)
        switch style {
        case .left:
            self.setImage(iconBut.left, for: .normal)
        case .right:
            self.setImage(iconBut.right, for: .normal)
        case .up:
            self.setImage(iconBut.up, for: .normal)
        case .down:
            self.setImage(iconBut.down, for: .normal)
        }
        self.tintColor = .darkGray
        self.backgroundColor = .systemGreen
        self.layer.borderColor = UIColor.yellow.cgColor
        self.layer.borderWidth = bordWidth
        self.layer.cornerRadius = cornRad
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
