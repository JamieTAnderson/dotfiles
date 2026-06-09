---
name: elif
description: elif, ELI5, explain-like-I'm-5 comments - Use when the user asks to add a very simple code comment explaining what selected code does and why it exists.
---

# Explain Like I'm Five Comment

Use this skill when the user asks for `elif`, `ELI5`, or an explain-like-I'm-5 comment on code.

## Goal

Add a code comment that explains the selected or referenced code in plain, simple language. The comment must explain both:

- What the code does.
- Why the code exists or why it is needed.

## Process

1. Read the selected code or referenced file section.
2. Identify the smallest useful place for the comment, usually directly above the code being explained.
3. Use the target language's normal comment style.
4. Add one short comment, or two short lines if one line would be unclear.
5. Keep the code behavior unchanged.

## Comment Style

- Write for a beginner, using everyday words.
- Prefer concrete explanations over jargon.
- Explain the reason, not just the mechanics.
- Keep it short enough to belong in source code.
- Do not use baby talk, jokes, emojis, or long analogies.
- Do not add a comment if it would only repeat an obvious line of code.

## Examples

Good:

```ts
// We remember this user id so later requests know who they belong to.
const userId = session.user.id
```

Good:

```lua
-- This stops old search results from showing after the user types something new.
results = {}
```

Bad:

```ts
// This assigns session.user.id to userId.
const userId = session.user.id
```

Bad:

```ts
// Imagine a magical toy box where tiny helper elves keep track of who owns every button press in the whole kingdom.
const userId = session.user.id
```

## Completion Checklist

Before finishing:

- The comment explains what the code does.
- The comment explains why the code exists.
- The language is simple and beginner-friendly.
- The code still does exactly the same thing.
