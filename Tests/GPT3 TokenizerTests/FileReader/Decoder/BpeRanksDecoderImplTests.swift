//
//  BpeRanksDecoderImplTests.swift
//  
//
//  Created by Alberto Espinilla Garrido on 5/3/23.
//

import XCTest
@testable import GPT3Tokenizer

final class BpeRanksDecoderImplTests: XCTestCase {
    private var sut: BpeRanksDecoder!
    
    override func setUpWithError() throws {
        sut = BpeRanksDecoderImpl()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testGivenDataWhenDecodeThenMatch() throws {
        let text = """
            a b
            c d
            fg hi
        """
        let expected = [Pairs(first: "a", second: "b"): 0, Pairs(first: "c", second: "d"): 1, Pairs(first: "fg", second: "hi"): 2]
        let data = try XCTUnwrap(text.data(using: .utf8))
        let output = try sut.decode(from: data)
        XCTAssertEqual(output, expected)
    }
}
