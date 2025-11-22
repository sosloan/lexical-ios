import Foundation

// Entry point for the Fundamental Lemma SL(2) demonstration
// This file must be compiled together with:
//   - FundamentalLemmaSL2.swift (core implementation)
//   - FundamentalLemmaSL2Demo.swift (defines runDemo function)
//
// Compile with:
//   swiftc -o test FundamentalLemmaSL2.swift FundamentalLemmaSL2Demo.swift TestFundamentalLemma.swift
//
// Run with:
//   ./test

@main
struct FundamentalLemmaApp {
    static func main() {
        // Call runDemo() defined in FundamentalLemmaSL2Demo.swift
        runDemo()
    }
}
