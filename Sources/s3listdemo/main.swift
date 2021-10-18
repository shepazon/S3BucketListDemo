import Foundation
@testable import S3BucketList
import AWSS3
import AWSClientRuntime
import ClientRuntime

// Enable SDK debugging output

SDKLoggingSystem.initialize(logLevel: .info)

// Instantiate the main identity functions object

do {
    let config = try S3Client.S3ClientConfiguration(region: "us-east-1")
    let bucketListDemo = try S3BucketList(/*config: config*/)
    let bucketList = try bucketListDemo.buckets()
    let numBuckets = bucketList.count
    
    printHeading("Testing S3 Bucket Lists", over: "=", under: "=", blanks: 2)
    
    if (numBuckets != 0) {
        printHeading("Found \(numBuckets) buckets", length:60)
        for bucket in bucketList {
            print("   \(bucket)")
        }
        printHeading("", length: 60, blanks: 2)
    } else {
        print("No buckets found")
    }
} catch {
    dump(error, name: "Error fetching bucket list")
}

print("Exiting.")

/**
 Print a pretty heading with optional underscore.
 
 - parameter heading:   The heading string
 - parameter under:     The character to use for the underscore  (Default: "-")
 - parameter length:    The length of the underscore; 0 to match heading length (Default: 0)
 - parameter blanks:    The number of blank lines to add after the underscore  (Default: 0)
 */
func printHeading(_ heading: String, over: String = "", under: String = "-",
                  length: Int = 0, blanks: Int = 0) {
    let lineLength: Int
    let headingLength = heading.count
    
    if (length == 0) {
        lineLength = headingLength
    } else {
        lineLength = length
    }
    let underscore = String(repeating: under, count: lineLength)
    let overscore: String
    
    if (over.count == 1) {
        overscore = String(repeating: over, count: lineLength)
    } else {
        overscore = ""
    }
    if (overscore.count != 0) {
        print(overscore)
    }
    if (headingLength != 0) {
        print(heading)
    }
    print(underscore)
    if (blanks != 0) {
        for _ in 1 ... blanks {
            print()
        }
    }
}
