import UIKit

class BankAccount {
    var balance: Int = 0
    
    func deposit(value: Int) {
        balance += value
        print("Поступление на счет \(value)")
    }
    
    func withdraw(value: Int) {
        balance -= value
        print("Сняли со счета \(value)")
    }
    
    func showBalance() {
        print(balance)
    }
}

let bankAccount = BankAccount()



let replenishmentBalance = Thread {
    bankAccount.deposit(value: 100)
    bankAccount.deposit(value: 150)
}
replenishmentBalance.qualityOfService = .background
replenishmentBalance.start()

let cashWithdrawal = Thread {
    bankAccount.withdraw(value: 10)
    bankAccount.withdraw(value: 100)
}
cashWithdrawal.qualityOfService = .userInteractive
cashWithdrawal.start()

let lock = NSLock()
lock.lock()
print(bankAccount.balance)
lock.unlock()

print("------------------------------------")

let replenishmentQueue = DispatchQueue(label: "ru.replenishmentQueue.serial-queue")
let cashWithdrawalQueue = DispatchQueue(label: "ru.cashWithdrawalQueue.serial-queue")
let balanceQueue = DispatchQueue(label: "ru.balanceQueue.concurrent-queue", attributes: .concurrent)

balanceQueue.async {
    replenishmentQueue.sync {
        sleep(1)
        bankAccount.deposit(value: 20)
            replenishmentQueue.async {
                sleep(1)
                bankAccount.deposit(value: 20)
            }
    }
    
    cashWithdrawalQueue.sync {
        sleep(1)
        bankAccount.withdraw(value: 10)
    }
    
    replenishmentQueue.sync {
        sleep(1)
        bankAccount.deposit(value: 20)
    }
    
    cashWithdrawalQueue.sync {
        sleep(1)
        bankAccount.withdraw(value: 10)
    }
    
    DispatchQueue.main.sync {
        bankAccount.showBalance()
    }
}




