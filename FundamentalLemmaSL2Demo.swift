//
//  FundamentalLemmaSL2Demo.swift
//  Demonstration of Fundamental Lemma verification
//

import Foundation

// This file demonstrates the FundamentalLemmaSL2 implementation
// Compile with: swiftc -o demo FundamentalLemmaSL2.swift FundamentalLemmaSL2Demo.swift

func runDemo() {
    print("""
    ╔═══════════════════════════════════════════════════════════════╗
    ║  FUNDAMENTAL LEMMA FOR SL(2) - DEMONSTRATION                  ║
    ║  Mathematical Framework Implementation in Swift               ║
    ╚═══════════════════════════════════════════════════════════════╝
    
    """)

    // Run the complete demonstration
    runFundamentalLemmaDemonstration()
    
    print("""
    
    ╔═══════════════════════════════════════════════════════════════╗
    ║  ADDITIONAL EXAMPLES                                          ║
    ╚═══════════════════════════════════════════════════════════════╝
    """)

    // Example 1: Complex number arithmetic
    print("\n📐 Example 1: Complex Number Arithmetic")
    print(String(repeating: "-", count: 50))
    let z1 = ComplexNumber(3, 4)
    let z2 = ComplexNumber(1, 2)
    print("z₁ = \(z1)")
    print("z₂ = \(z2)")
    print("z₁ + z₂ = \(z1 + z2)")
    print("z₁ × z₂ = \(z1 * z2)")
    print("|z₁| = \(String(format: "%.2f", z1.magnitude))")
    print("arg(z₁) = \(String(format: "%.2f", z1.phase)) radians")

    // Example 2: Signal composition
    print("\n🎵 Example 2: Signal Composition")
    print(String(repeating: "-", count: 50))
    let carrier = Signal.sinusoidal(amplitude: 1.0, frequency: 10.0)
    print("Created carrier signal (10 Hz)")
    let carrierSamples = carrier.sample(from: 0, to: 0.5, steps: 5)
    print("Carrier samples: \(carrierSamples.map { String(format: "%.3f", $0.magnitude) })")

    // Example 3: Matrix operations
    print("\n🔢 Example 3: Matrix Operations in SL(2)")
    print(String(repeating: "-", count: 50))
    
    // Create a proper SL(2) matrix
    let M = Matrix(real: [[2, 1], [1, 1]]) // det = 2·1 - 1·1 = 1 ✓
    print("Matrix M:")
    print("  [[2, 1],")
    print("   [1, 1]]")
    print("det(M) = \(M.determinant)")
    print("tr(M) = \(M.trace)")
    print("M ∈ SL(2)? \(M.isInSL2)")
    print("M is regular semisimple? \(M.isRegularSemisimple)")

    // Example 4: Local field properties
    print("\n🔬 Example 4: Local Field (p-adic) Properties")
    print(String(repeating: "-", count: 50))
    let Q7 = LocalField(0, 7, 7)
    let numbers = [7, 49, 343, 1, 14]
    print("Working in \(Q7) (7-adic numbers):")
    for n in numbers {
        let v = Q7.valuation(n)
        let norm = Q7.norm(n)
        print("  v₇(\(n)) = \(v), |\(n)|₇ = \(String(format: "%.6f", norm))")
    }

    // Example 5: Ordinal hierarchy
    print("\n♾️  Example 5: Transfinite Ordinal Hierarchy")
    print(String(repeating: "-", count: 50))
    let ordinals = (1...5).map { TransfiniteOrdinal.omega($0) }
    print("Ordinal hierarchy:")
    for omega in ordinals {
        print("  \(omega)")
    }
    print("\nVerifying hierarchy property:")
    for i in 0..<(ordinals.count - 1) {
        let result = ordinals[i] < ordinals[i + 1]
        print("  \(ordinals[i]) < \(ordinals[i + 1]): \(result ? "✓" : "✗")")
    }

    // Example 6: Custom verification
    print("\n🎯 Example 6: Custom Fundamental Lemma Test")
    print(String(repeating: "-", count: 50))
    let Q3 = LocalField(0, 3, 3)
    let G = ReductiveGroup("SL2", 1, Q3)
    let H = ReductiveGroup("T", 1, Q3)
    
    // Create test elements
    let lambda = ComplexNumber(1.618, 0.618) // Golden ratio + imaginary
    let lambdaInv = ComplexNumber(1.0, 0) / lambda
    
    let gamma = Matrix.diagonal(lambda, lambdaInv)
    let gammaH = Matrix.diagonal(lambda, lambdaInv)
    
    print("Testing with λ = \(String(format: "%.3f + %.3fi", lambda.real, lambda.imaginary))")
    print("λ⁻¹ = \(String(format: "%.3f + %.3fi", lambdaInv.real, lambdaInv.imaginary))")
    print("γ is regular semisimple: \(gamma.isRegularSemisimple)")
    
    let orbitalG = OrbitalIntegral.compute(group: G, element: gamma)
    let orbitalH = OrbitalIntegral.compute(group: H, element: gammaH)
    print("Orbital integral on G: \(String(format: "%.6f", orbitalG))")
    print("Orbital integral on H: \(String(format: "%.6f", orbitalH))")
    
    let verified = OrbitalIntegral.compare(G, H, gamma, gammaH)
    print("Fundamental Lemma verified: \(verified ? "✓" : "✗")")
    
    print("""
    
    ╔═══════════════════════════════════════════════════════════════╗
    ║  DEMONSTRATION COMPLETE                                       ║
    ║                                                               ║
    ║  This implementation provides a framework for:                ║
    ║  • Signal and operator spaces (𝒮, 𝒪)                          ║
    ║  • Phase space Φ = [0, 2π)                                    ║
    ║  • Local fields and p-adic numbers                            ║
    ║  • Reductive groups (SL2, Torus)                              ║
    ║  • Orbital integrals                                          ║
    ║  • Fundamental Lemma verification                             ║
    ║  • Transfinite ordinal arithmetic                             ║
    ║                                                               ║
    ║  Mathematical ownership achieved! 🎯                          ║
    ╚═══════════════════════════════════════════════════════════════╝
    """)
}
