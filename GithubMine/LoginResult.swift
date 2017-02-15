//
//  LoginResult.swift
//  GithubMine
//
//  Created by TriNgo on 2/15/17.
//  Copyright © 2017 CoderSchool. All rights reserved.
//

enum LoginResult {
    case OK
    case Failed(message: String)
}

extension LoginResult: Equatable {}

func == (lhs: LoginResult, rhs: LoginResult) -> Bool {
    switch (lhs, rhs) {
    case (.OK, .OK):
        return true
    case (.Failed(let x), .Failed(let y)) where x == y:
        return true
    default:
        return false
    }
}
