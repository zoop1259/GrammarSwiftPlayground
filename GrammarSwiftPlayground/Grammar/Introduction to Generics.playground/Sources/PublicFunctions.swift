
import Foundation

//code의 관한 코드. 
public func code(for title: String,
                    sampleCode: () -> Void) {
print("""
_____________________________
Results for: '\(title)'
/////////////////////////////
""")
  sampleCode()
}
