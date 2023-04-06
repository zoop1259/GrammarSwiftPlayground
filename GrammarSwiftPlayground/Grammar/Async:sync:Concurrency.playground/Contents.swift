import UIKit
import Combine

let a = 26076 + 20045+20851+20964+21509

func justGCD() {
    DispatchQueue.global().async {
        // A 스레드에서 3~5개의 숫자를 불러오는 작업
        let numbers = [3, 4, 5]
        
        for number in numbers {
            // 각 숫자가 불려질 때마다 B 스레드에서 작업 수행
            DispatchQueue.main.async {
                // B 스레드에서 0.4초의 딜레이를 가지고 작업 수행
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    print("Number: \(number)")
                }
            }
        }
    }
}

//justGCD()

func ABQueue1() {
    let AQueue = DispatchQueue(label: "A")
    let BQueue = DispatchQueue(label: "B")
    
    // A 스레드에서 숫자를 가져오는 작업
    AQueue.async {
        let numbers = [3, 4, 5] // 숫자 배열 생성
        
        for number in numbers {
            BQueue.async {
                print("Number: \(number)") // 각 숫자가 불려질 때마다 B 스레드에서 작업 수행
            }
        }
    }
}

//ABQueue1()

func ABQueue() {
    let AQueue = DispatchQueue(label: "A")
    let BQueue = DispatchQueue(label: "B")
    
    // A 스레드에서 숫자를 가져오는 작업
    AQueue.async {
        var numbers = [Int]()
        
        // numbers 배열에 랜덤 값을 3번 추가
        for _ in 1...3 {
            let randomNum = Int.random(in: 1...100)
            numbers.append(randomNum)
            print("Added number: \(randomNum)")
            
            BQueue.async {
                print("Number: \(randomNum)") // 각 숫자가 불려질 때마다 B 스레드에서 작업 수행
            }
            Thread.sleep(forTimeInterval: 0.3) // 0.3초 딜레이
        }
    }
}

//ABQueue()

print("------------------- async / await --------------------")
func randomNumber() -> Int {
    return Int.random(in: 1...10)
}

func delay(_ timeInterval: Double) async {
    await Task.sleep(UInt64(timeInterval * Double(NSEC_PER_SEC)))
}

func generateNumbers() async -> Int {
    var sum = 0
    var count = 0
    
    while count < 2 {
        let number1 = randomNumber()
        let number2 = randomNumber()
        print("Generated numbers: \(number1), \(number2)")
        sum += number1 + number2
        
        await delay(0.3)
        
        count += 1
    }
    
    return sum
}

Task {
    let result = await generateNumbers()
    print("Sum of generated numbers: \(result)")
}

