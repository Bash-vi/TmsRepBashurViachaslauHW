//
//  WebButton.swift
//  HW23WebKit
//
//  Created by Вячеслав Башур on 27/08/2024.
//

import UIKit

class WebButton: UIButton {
    
    enum Style {
        case back
        case next
        case bookmarks
        case addBookmark
        case reset
    }
    
    enum Icons {
        static let back = UIImage(systemName: "chevron.backward")
        static let next = UIImage(systemName: "chevron.forward")
        static let bookmarks = UIImage(systemName: "book")
        static let addBookmark = UIImage(systemName: "square.and.arrow.up")
        static let reset = UIImage(systemName: "rectangle.portrait.and.arrow.forward")
    }
    
    private var action: () -> Void
   
    init(
        style: Style,
        action: @escaping () -> Void
    ){
        self.action = action
        super.init(frame: .zero)
        switch style {
        case.back:
            self.setImage(Icons.back, for: .normal)
        case.next:
            self.setImage(Icons.next, for: .normal)
        case.bookmarks:
            self.setImage(Icons.bookmarks, for: .normal)
        case.addBookmark:
            self.setImage(Icons.addBookmark, for: .normal)
        case.reset:
            self.setImage(Icons.reset, for: .normal)
        }
        self.addAction(.init(handler: { _ in
            self.action()
        }), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
