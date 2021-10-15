import XCTest
import class Foundation.Bundle
@testable import S3BucketList

/// Class based on `XCTestCase` that's run to perform testing of the project code.
final class S3BucketListTests: XCTestCase {
    var bucketList: S3BucketList? = nil
    
    /// Perform setup work needed by all tests.
    override func setUp() {
        do {
            bucketList = try S3BucketList()
        } catch {
            dump(error, name: "Error during test setup")
            exit(1)
        }
    }
    
    /// **Test:** Attempt to find an identity pool that doesn't exist. If no error occurs, the test
    /// fails.
    func testFindNonexistent() {
        //let poolID = identityTester?.getIdentityPoolID(name: "BogusPoolIsBogus", createIfMissing: false)
        //XCTAssertNil(poolID, "Found identity pool that does not exist")
    }
}
