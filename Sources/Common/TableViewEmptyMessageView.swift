

import UIKit

public class TableViewEmptyListMessageView: UIView {

    public var messageLabel: UILabel!
    
    public var message: String? {
        didSet {
            messageLabel.text = message
        }
    }
    
    private var centerYConstraint: NSLayoutConstraint!
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    public init(message: String) {
        super.init(frame: .zero)
        self.message = message
        setup()
    }
    
    private func setup() {
        messageLabel = UILabel()
        messageLabel.text = message
        messageLabel.font = UIFont(name: "Muli-Bold", size: 18)
        messageLabel.textAlignment = .center
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.numberOfLines = 0
        addSubview(messageLabel)
        messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }

}
