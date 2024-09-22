//
//  UserCell.swift
//  HW29API
//
//  Created by Вячеслав Башур on 18/09/2024.
//

import UIKit

class UserCell: UITableViewCell {
    static let reuseId = "UserCell"
    
    private var cellView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray6
        view.layer.borderWidth = Constant.borderWidth
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = Constant.corRad
        return view
    }()
    
    private var userStack = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = Constant.minSpasing
        return stack
    }()
    
    private var adressStack = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = Constant.minSpasing
        return stack
    }()
    
    private var companyStack = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = Constant.minSpasing
        return stack
    }()
    
    lazy var name = getValuelabel()
    lazy var username = getValuelabel()
    lazy var email = getValuelabel()
    lazy var phone = getValuelabel()
    lazy var website = getValuelabel()
    lazy var street = getValuelabel()
    lazy var suite = getValuelabel()
    lazy var city = getValuelabel()
    lazy var zipcode = getValuelabel()
    lazy var lat = getValuelabel()
    lazy var lng = getValuelabel()
    lazy var companyName = getValuelabel()
    lazy var catchPhrase = getValuelabel()
    lazy var bs = getValuelabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cellView)
        cellView.addSubview(userStack)
        cellView.addSubview(adressStack)
        cellView.addSubview(companyStack)
        createUserStack()
        createAdressStack()
        createCompanyStack()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createSubtitleLabel(subtitle: String) -> UILabel {
        let label = UILabel()
        label.text = subtitle
        label.font = UIFont.systemFont(ofSize: 19, weight: .semibold)
        label.numberOfLines = 0
        label.widthAnchor.constraint(equalToConstant: Constant.labelWidth).isActive = true
        return label
    }
    
    private func getValuelabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.numberOfLines = 0
        return label
    }
    
    private func createTitleValueStack(title: String, valueLadel: UILabel) -> UIStackView {
        let titleLabel = {
            let label = UILabel()
            label.text = title
            label.font = UIFont.systemFont(ofSize: 16, weight: .ultraLight)
            label.numberOfLines = 0
            label.widthAnchor.constraint(equalToConstant: Constant.labelWidth).isActive = true
            return label
        }()
        
        let horizontStack = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.spacing = Constant.minSpasing
            return stack
        }()
        
        horizontStack.addArrangedSubview(titleLabel)
        horizontStack.addArrangedSubview(valueLadel)
        return horizontStack
    }
    
    private func createUserStack() {
        let title = createSubtitleLabel(subtitle: TitleUser.user)
        
        let horizontStack = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.spacing = Constant.minSpasing
            return stack
        }()
        horizontStack.addArrangedSubview(title)
        horizontStack.addArrangedSubview(username)
        
        let nameStack = createTitleValueStack(title: TitleUser.name, valueLadel: name)
        
        let fullNameStack = {
            let stack = UIStackView()
            stack.axis = .vertical
            
            stack.spacing = Constant.minSpasing
            return stack
        }()
        fullNameStack.addArrangedSubview(horizontStack)
        fullNameStack.addArrangedSubview(nameStack)
        
        let icon = {
            let icon = UIImageView()
            icon.image = UIImage(systemName: "person.crop.square.fill")
            icon.contentMode = .scaleAspectFill
            icon.backgroundColor = .gray.withAlphaComponent(0.1)
            icon.layer.cornerRadius = Constant.corRad
            icon.tintColor = .blue
            icon.widthAnchor.constraint(equalToConstant: Constant.iconSize).isActive = true
            icon.heightAnchor.constraint(equalToConstant: Constant.iconSize).isActive = true
            return icon
        }()
        
        let iconStack = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.distribution = .fillProportionally
            stack.alignment = .center
            stack.spacing = Constant.minSpasing
            return stack
        }()
        iconStack.addArrangedSubview(icon)
        iconStack.addArrangedSubview(fullNameStack)
        
        let emailStack = createTitleValueStack(title: TitleUser.email, valueLadel: email)
        let phoneStack = createTitleValueStack(title: TitleUser.phone, valueLadel: phone)
        let websiteStack = createTitleValueStack(title: TitleUser.website, valueLadel: website)
        userStack.addArrangedSubview(iconStack)
        userStack.addArrangedSubview(emailStack)
        userStack.addArrangedSubview(phoneStack)
        userStack.addArrangedSubview(websiteStack)
    }
    
    private func createAdressStack() {
        let subtitleAdress = createSubtitleLabel(subtitle: TitleAdress.adress)
        let streetStack = createTitleValueStack(title: TitleAdress.street, valueLadel: street)
        let suiteStack = createTitleValueStack(title: TitleAdress.suite, valueLadel: suite)
        let cityStack = createTitleValueStack(title: TitleAdress.city, valueLadel: city)
        let zipcodeStack = createTitleValueStack(title: TitleAdress.zipcode, valueLadel: zipcode)

        let subtitleGeo = {
            let label = UILabel()
            label.text = TitleAdress.geo
            label.font = UIFont.systemFont(ofSize: 17, weight: .ultraLight)
            label.numberOfLines = 0
            label.widthAnchor.constraint(equalToConstant: Constant.labelWidth).isActive = true
            return label
        }()
        
        let latStack = createTitleValueStack(title: TitleAdress.lat, valueLadel: lat)
        let lngStack = createTitleValueStack(title: TitleAdress.lng, valueLadel: lng)
        adressStack.addArrangedSubview(subtitleAdress)
        adressStack.addArrangedSubview(streetStack)
        adressStack.addArrangedSubview(suiteStack)
        adressStack.addArrangedSubview(cityStack)
        adressStack.addArrangedSubview(zipcodeStack)
        adressStack.addArrangedSubview(subtitleGeo)
        adressStack.addArrangedSubview(latStack)
        adressStack.addArrangedSubview(lngStack)
    }
    
    private func createCompanyStack() {
        let subtitleCompany = createSubtitleLabel(subtitle: TitleCompany.company)
        let companyNameStack = createTitleValueStack(title: TitleCompany.companyName, valueLadel: companyName)
        let catchPhraseStack = createTitleValueStack(title: TitleCompany.catchPhrase, valueLadel: catchPhrase)
        let bsStack = createTitleValueStack(title: TitleCompany.bs, valueLadel: bs)
        companyStack.addArrangedSubview(subtitleCompany)
        companyStack.addArrangedSubview(companyNameStack)
        companyStack.addArrangedSubview(catchPhraseStack)
        companyStack.addArrangedSubview(bsStack)
    }
    
    func setupUserStack(
        nameValue: String,
        usernameValue: String,
        emailValue: String,
        phoneValue: String,
        websiteValue: String
    ){
        name.text = nameValue
        username.text = usernameValue
        email.text = emailValue
        phone.text = phoneValue
        website.text = websiteValue
    }
    
    func setupAdressStack(
        streetValue: String,
        suiteValue: String,
        cityValue: String,
        zipcodeValue: String,
        latValue: String,
        lngValue: String
    ) {
        street.text = streetValue
        suite.text = suiteValue
        city.text = cityValue
        zipcode.text = zipcodeValue
        lat.text = latValue
        lng.text = lngValue
    }
    
    func setupCompanyStack(
        companyNameValue: String,
        catchPhraseValue: String,
        bsValue: String
    ){
        companyName.text = companyNameValue
        catchPhrase.text = catchPhraseValue
        bs.text = bsValue
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: Constant.maxSpacing
            ),
            cellView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -Constant.maxSpacing
            ),
            cellView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constant.maxSpacing
            ),
            cellView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -Constant.maxSpacing
            ),
            
            userStack.topAnchor.constraint(
                equalTo: cellView.topAnchor,
                constant: Constant.maxSpacing
            ),
            userStack.trailingAnchor.constraint(
                equalTo: cellView.trailingAnchor,
                constant: -Constant.maxSpacing
            ),
            userStack.leadingAnchor.constraint(
                equalTo: cellView.leadingAnchor,
                constant: Constant.maxSpacing
            ),
            
            adressStack.topAnchor.constraint(
                equalTo: userStack.bottomAnchor,
                constant: Constant.maxSpacing
            ),
            adressStack.trailingAnchor.constraint(
                equalTo: cellView.trailingAnchor,
                constant: -Constant.maxSpacing
            ),
            adressStack.leadingAnchor.constraint(
                equalTo: cellView.leadingAnchor,
                constant: Constant.maxSpacing
            ),
            
            companyStack.topAnchor.constraint(
                equalTo: adressStack.bottomAnchor,
                constant: Constant.maxSpacing
            ),
            companyStack.trailingAnchor.constraint(
                equalTo: cellView.trailingAnchor,
                constant: -Constant.maxSpacing
            ),
            companyStack.leadingAnchor.constraint(
                equalTo: cellView.leadingAnchor,
                constant: Constant.maxSpacing
            ),
            companyStack.bottomAnchor.constraint(
                equalTo: cellView.bottomAnchor,
                constant: -Constant.maxSpacing
            ),
        ])
    }
}
