---
name: idiomatic-go
description: idiomatic-go, Google Go Style Guide, Effective Go - Use when writing, refactoring, or reviewing Go code so changes follow widely used Go style guidance.
---

# Idiomatic Go

Use this skill when working on Go code and the user asks for idiomatic Go, Go style, Go review, Go refactoring, or Google Go style.

## Source Of Truth

Follow these public Go style references, in this order:

1. Google Go Style Guide: https://google.github.io/styleguide/go/guide
2. Google Go Style Decisions: https://google.github.io/styleguide/go/decisions
3. Google Go Best Practices: https://google.github.io/styleguide/go/best-practices
4. Effective Go: https://go.dev/doc/effective_go

Google's guide defines idiomatic code as code that is common, familiar, and easy for Go readers to recognize. Prefer the guide over personal preference. Prefer established local project style when the guide does not cover a point and the local style does not conflict with the guide.

## Core Principles

Apply the Google Go Style Guide priorities in this order:

1. Clarity: make purpose and rationale clear to the reader.
2. Simplicity: use the simplest approach that solves the problem.
3. Concision: keep signal high and noise low.
4. Maintainability: make future changes safe and obvious.
5. Consistency: match nearby Go code when no stronger rule applies.

## Checklist

When writing or changing Go code:

- Run or preserve `gofmt` formatting. Use `goimports` when imports change if it is available in the project.
- Use `MixedCaps` or `mixedCaps` for identifiers, not snake case.
- Use short, lowercase package names without underscores.
- Avoid stutter between package names and exported identifiers.
- Keep receiver names short, usually one or two letters, and consistent for the type.
- Preserve initialisms: use `URL` or `url`, `ID` or `id`, not `Url` or `Id`.
- Avoid `Get` prefixes for ordinary getters. Prefer `Owner()` over `GetOwner()`.
- Prefer straightforward control flow. Handle errors early and keep the happy path unindented.
- Return `error` as the last result. Do not ignore errors unless a comment explains why it is safe.
- Write error strings in lowercase without trailing punctuation unless a proper noun or exported name requires it.
- Prefer useful zero values and simple constructors. Do not add constructors only to set zero values.
- Prefer concrete types until an interface provides clear decoupling at the caller boundary.
- Keep interfaces small and name single-method interfaces with the `-er` convention when appropriate.
- Prefer standard library and core language features before adding abstractions or dependencies.
- Use `len(s) == 0` for slice emptiness checks unless the nil distinction is part of the API.
- Prefer nil slices for empty local slices when returning or accumulating unless a non-nil slice is required.
- Use table-driven tests when they make repeated cases clearer.
- Make test failures actionable with inputs, got values, and want values.
- Comments should explain why or document exported API. Do not restate obvious code.
- Exported declarations need doc comments that begin with the declared name and are complete sentences.

## Before Finishing

- Check nearby Go code for local naming, error handling, and test patterns.
- Remove cleverness or unnecessary abstraction introduced by the change.
- If you changed Go code, run the narrowest useful Go verification command, such as `go test ./...` or the package-specific test command.
- If a requested change conflicts with the Google Go Style Guide, call that out and explain the tradeoff.
