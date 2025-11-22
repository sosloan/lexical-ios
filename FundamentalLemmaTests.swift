//
//  FundamentalLemmaTests.swift
//  Unit tests for the Fundamental Lemma SL(2) implementation
//

import Foundation

func runTests() {
    print("🧪 Running Unit Tests for Fundamental Lemma SL(2)")
    print(String(repeating: "=", count: 60))
    
    var testsPassed = 0
    var testsFailed = 0
    
    func test(_ name: String, _ condition: Bool) {
        if condition {
            print("✅ PASS: \(name)")
            testsPassed += 1
        } else {
            print("❌ FAIL: \(name)")
            testsFailed += 1
        }
    }
    
    // Test 1: Complex number arithmetic
    let z1 = ComplexNumber(3, 4)
    let z2 = ComplexNumber(1, 2)
    let sum = z1 + z2
    test("Complex addition", sum.real == 4.0 && sum.imaginary == 6.0)
    test("Complex magnitude", abs(z1.magnitude - 5.0) < 1e-10)
    
    // Test 2: Matrix determinant
    let M = Matrix(real: [[2, 1], [1, 1]])
    let det = M.determinant
    test("Matrix determinant (SL2)", abs(det.real - 1.0) < 1e-10 && abs(det.imaginary) < 1e-10)
    test("Matrix in SL(2)", M.isInSL2)
    
    // Test 3: Matrix trace
    let tr = M.trace
    test("Matrix trace", abs(tr.real - 3.0) < 1e-10 && abs(tr.imaginary) < 1e-10)
    test("Regular semisimple", M.isRegularSemisimple) // tr ≠ ±2
    
    // Test 4: Phase space normalization
    let phase1 = PhaseSpace.normalize(3 * .pi)
    test("Phase normalization (positive)", phase1 >= 0 && phase1 < 2 * .pi)
    let phase2 = PhaseSpace.normalize(-.pi / 2)
    test("Phase normalization (negative)", phase2 >= 0 && phase2 < 2 * .pi)
    
    // Test 5: Local field p-adic valuation
    let Q7 = LocalField(0, 7, 7)
    test("p-adic valuation of 49 in Q7", Q7.valuation(49) == 2)
    test("p-adic valuation of 1 in Q7", Q7.valuation(1) == 0)
    
    // Test 6: Transfinite ordinal ordering
    let omega1 = TransfiniteOrdinal.omega(1)
    let omega2 = TransfiniteOrdinal.omega(2)
    let omega3 = TransfiniteOrdinal.omega(3)
    test("Ordinal ordering ω¹ < ω²", omega1 < omega2)
    test("Ordinal ordering ω² < ω³", omega2 < omega3)
    test("Ordinal ordering transitivity", omega1 < omega3)
    
    // Test 7: Signal sampling
    let signal = Signal.sinusoidal(amplitude: 1.0, frequency: 1.0)
    let samples = signal.sample(from: 0, to: 1, steps: 5)
    test("Signal sampling count", samples.count == 5)
    test("Signal sampling non-empty", samples.allSatisfy { $0.magnitude >= 0 })
    
    // Test 8: Reductive group membership
    let Q2 = LocalField(0, 2, 2)
    let SL2 = ReductiveGroup("SL2", 1, Q2)
    let identityMatrix = Matrix.identity
    test("Identity in SL(2)", SL2.contains(identityMatrix))
    
    // Test 9: Torus group
    let Torus = ReductiveGroup("T", 1, Q2)
    let diagonal = Matrix.diagonal(.one, .one)
    test("Diagonal in Torus", Torus.contains(diagonal))
    
    // Test 10: Diagonal matrix in SL(2)
    test("Diagonal in SL(2)", SL2.contains(diagonal))
    
    // Test 11: Phase space contains test
    test("Phase space contains 0", PhaseSpace.contains(0))
    test("Phase space contains π", PhaseSpace.contains(.pi))
    test("Phase space contains 2π-ε", PhaseSpace.contains(2 * .pi - 0.001))
    
    // Test 12: Ordinal arithmetic
    let omegaSum = omega1 + omega2
    test("Ordinal addition ω¹ + ω² = ω²", omegaSum == omega2)
    let omegaProd = omega1 * omega2
    let omega3Expected = TransfiniteOrdinal.omega(3)
    test("Ordinal multiplication ω¹ × ω² = ω³", omegaProd == omega3Expected)
    
    // Test 13: Complex exponential
    let z = ComplexNumber(0, .pi)
    let expZ = ComplexNumber.exp(z)
    test("Euler's formula e^(iπ) ≈ -1", abs(expZ.real - (-1.0)) < 0.1)
    
    // Test 14: Matrix diagonal
    let lambda1 = ComplexNumber(2, 0)
    let lambda2 = ComplexNumber(0.5, 0)
    let diag = Matrix.diagonal(lambda1, lambda2)
    test("Diagonal matrix det=1", abs(diag.determinant.real - 1.0) < 1e-10)
    
    // Test 15: Signal operator composition
    let op1 = SignalOperator.scale(2.0)
    let op2 = SignalOperator.scale(0.5)
    let composed = op1.compose(with: op2)
    let testSignal = Signal.constant(.one)
    let result = composed.apply(to: testSignal).evaluate(at: 0)
    test("Operator composition", abs(result.real - 1.0) < 1e-10) // 2.0 * 0.5 = 1.0
    
    print(String(repeating: "=", count: 60))
    print("📊 Test Results:")
    print("   Passed: \(testsPassed)")
    print("   Failed: \(testsFailed)")
    print("   Total:  \(testsPassed + testsFailed)")
    print("")
    
    if testsFailed == 0 {
        print("🎉 All tests passed! ✅")
    } else {
        print("⚠️  Some tests failed. Please review.")
    }
}
