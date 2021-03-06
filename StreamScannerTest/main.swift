//
//  Created by Anthony Shoumikhin on 6/25/15.
//  Copyright © 2015 shoumikh.in. All rights reserved.
//

import Foundation
import StreamScanner

let stdin = StreamScanner.standardInput

// Read some arbitrary values of different type from the standard input.
if let int: Int = stdin.read(),
    let string: String = stdin.read(),
    let double: Double = stdin.read(),
    let int64: Int64 = stdin.read(),
    let float: Float = stdin.read() {
  print("\(int) \(string) \(double) \(int64) \(float)")
}

// Read an array of Int64 of predefined size.
if var count: Int = stdin.read() {
  var array: [Int64] = []
  for _ in 0..<count {
    if let integer: Int64 = stdin.read() {
      array.append(integer)
    }
  }
  print(array)
}

// Read strings from the stream in a for loop.
for name in stdin {
  print("Hello, \(name)!")
}

// Read and present the contents of /etc/passwd file.
if let input = FileHandle(forReadingAtPath: "/etc/passwd") {
  let scanner = StreamScanner(source: input, delimiters: CharacterSet(charactersIn: ":\n"))
  print("User Database:")
  while let line: String = scanner.read() {
    // Skip comments.
    if !line.hasPrefix("#") {
      let username = line
      if let valid: String = scanner.read(),
          let userId: Int = scanner.read(),
          let groupId: Int = scanner.read(),
          let gecos: String = scanner.read(),
          let home: String = scanner.read(),
          let shell: String = scanner.read() {
        print("------------------------------")
        print("User: \t\(username) (\(gecos))")
        print("UID:  \t\(userId)")
        print("GID:  \t\(groupId)")
        print("Home: \t\(home)")
        print("Shell:\t\(shell)")
      }
    }
  }
}
