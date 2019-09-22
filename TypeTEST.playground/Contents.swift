import UIKit

var str = "Hello, playground"

struct TestValue {
    var temp1, temp2 : Int
}

final class TestReference {
    var temp1, temp2 : Int

    init(temp1: Int, temp2: Int) {
        self.temp1 = temp1
        self.temp2 = temp2
    }
}

do {
    let testValue1 = TestValue(temp1: 1, temp2: 2)
    var testValue2 = testValue1
    testValue2.temp1 = 10
    dump(testValue1)
    dump(testValue2)
}

do {
    let testReference1 = TestReference(temp1: 1, temp2: 2)
    let testReference2 = testReference1
    testReference2.temp1 = 10
    dump(testReference1)
    dump(testReference2)
}
