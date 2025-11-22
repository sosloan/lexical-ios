import Foundation

// Entry point for the Fundamental Lemma SL(2) demonstration
// This file must be compiled together with:
//   - FundamentalLemmaSL2.swift (core implementation)
//   - FundamentalLemmaSL2Demo.swift (defines runDemo function)
//   - FundamentalLemmaTests.swift (defines runTests function - optional)
//
// Compile with demo:
//   swiftc -o test FundamentalLemmaSL2.swift FundamentalLemmaSL2Demo.swift TestFundamentalLemma.swift
//
// Compile with tests:
//   swiftc -o test FundamentalLemmaSL2.swift FundamentalLemmaTests.swift TestFundamentalLemma.swift
//
// Run with:
//   ./test

@main
struct FundamentalLemmaApp {
    static func main() {
        // Uncomment the one you want to run:
        
        // Run comprehensive demonstration (requires FundamentalLemmaSL2Demo.swift):
        // runDemo()
        
        // Or run unit tests (requires FundamentalLemmaTests.swift):
        runTests()
    }
}
