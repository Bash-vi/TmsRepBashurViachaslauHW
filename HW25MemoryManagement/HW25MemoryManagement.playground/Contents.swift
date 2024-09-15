import UIKit

class PersonTest {
    let name: String
    
    init(
        name: String
    ) {
        self.name = name
        print("Init PersonTest")
    }
    
    deinit {
        print("PersonTest deinited")
    }
}

func test() {
    let person = PersonTest(name: "bob")
}
test()
//Init PersonTest
//PersonTest deinited
print("======================================================")

class Person {
    let name: String
    let surename: String
    let age: Int
    private var apartments: [Apartment] = []
    
    func addApartment(_ apartment: Apartment) {
        apartments.append(apartment)
    }
    
    init(
        name: String,
        surename: String,
        age: Int
    ) {
        self.name = name
        self.surename = surename
        self.age = age
        print("Init Person")
    }
    
    deinit {
        print("Person deinited")
    }
}

class Apartment {
    let adress: String
    let rentalCost: Int
    weak var person: Person?
    
    init(
        adress: String,
        rentalCost: Int,
        person: Person
    ) {
        self.adress = adress
        self.rentalCost = rentalCost
        self.person = person
        print("Init Apartment")
    }
    
    deinit {
        print("Apartment deinited")
    }
}

var sasha = Person(
    name: "Sasha",
    surename: "Coin",
    age: 22
)

var sashaHome = Apartment(
    adress: "Ul. Lenina 1 - 1",
    rentalCost: 1000,
    person: sasha
)

sashaHome = .init(
    adress: "Ul. Rex 2 - 30",
    rentalCost: 2000,
    person: sasha
)

sasha = .init(
    name: "Sasha",
    surename: "Coin",
    age: 25
)

sasha.addApartment(sashaHome)
// Без weak не освобождается Person
// C weak var person: Person? освобождвется -> Person deinited
print("======================================================")

protocol PersonTwoDelegete: AnyObject {
    func personAddApartment(newApartment: ApartmentTwo)
}

class PersonTwo: PersonTwoDelegete {
    func personAddApartment(newApartment: ApartmentTwo) {
        print("Add")
        apartments.append(newApartment)
    }
    
    let name: String
    let surename: String
    let age: Int
    private var apartments: [ApartmentTwo] = []
    let apartment = ApartmentTwo(
        adress: "Ul. Wenskego",
        rentalCost: 2300
    )
        
    init(
        name: String,
        surename: String,
        age: Int
    ) {
        self.name = name
        self.surename = surename
        self.age = age
    }
    
    deinit {
        print("PersonTwo deinited")
    }
}

class ApartmentTwo {
    let adress: String
    let rentalCost: Int
    weak var delegate: PersonTwoDelegete?
    
    func addApartment() {
        delegate?.personAddApartment(newApartment: vovaHome)
    }
    
    init(
        adress: String,
        rentalCost: Int
    ) {
        self.adress = adress
        self.rentalCost = rentalCost
    }
    
    deinit {
        print("ApartmentTwo deinited")
    }
}

var vova = PersonTwo(
    name: "Vova",
    surename: "Coin",
    age: 35
)

var vovaHome = ApartmentTwo(
    adress: "Ul. Stalina 1 - 1",
    rentalCost: 4000
)

vova.apartment.delegate = vova

vova.apartment.addApartment()

vova = .init(
    name: "Vova",
    surename: "Coin",
    age: 35
)
// Без weak не освобождается PersonTwo и ApartmentTwo,
// т.к. счетчик зависимости 1 - 1 через протокол(делегат)
// weak var delegate: PersonTwoDelegete? освобождвется ->
// PersonTwo deinited и ApartmentTwo deinited

