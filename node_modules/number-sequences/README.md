# Number Sequences

JS library to generate a variety of immutable number sequences.

[![mikeyhogarth](https://circleci.com/gh/mikeyhogarth/number-sequences.svg?style=svg)](https://circleci.com/gh/mikeyhogarth/number-sequences)
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/d86b1fb82cf54880854ac0649ef3ab0f)](https://www.codacy.com/manual/mikeyhogarth/number-sequences?utm_source=github.com&utm_medium=referral&utm_content=mikeyhogarth/number-sequences&utm_campaign=Badge_Grade)
![npm](https://img.shields.io/npm/v/number-sequences)

## Installation

```
npm install number-sequences
```

## Example

All number sequences return an immutable sequence object - the
API for this is as per the ImmutableJS [`Seq`](https://immutable-js.github.io/immutable-js/docs/#/Seq) type.

```javascript
import { Arithmetic } from "number-sequences";

const seq = Arithmetic(1, 1);
seq.take(3).toArray(); // [1, 2, 3]
```

## Available sequences

The following types of sequence are available with the following parameters being permitted for each.

- `Arithmetic(start, commonDifference)`
- `Collatz(start)`
- `Fibonacci()`
- `Geometric(start, commonRatio)`
- `Power(start)`
- `Prime()`
- `Triangle()`
- `Twin(a, b)`
- `NthPower(n)`

# Contributing

## Build

```
npm build
```

## Tests

```
npm test
npm run test:watch
```
