# Session 1: Introduction to Python

## Introduction

This course will explore issues around computational thinking and using programming to express thinking

- Learn computational modes of thinking
- Master the art of computational problem solving
- Make computers do what you want them to do

"I don't have to do it; I can get the conmputer to do it"

Make the computer do the work for me.

### Topics

- Data structures
- Iteration and recursion
- Abstraction
- Organization and modularization of systems
- Algorithms
- Complexity

The above are all tools for finding more efficient and effective ways to solve problems.

### What does a computer really do?

Fundamentally: performs calculations and remembers results (storage).

#### What calculations?

- Built into the language (primitives, e.g. arithmetic, logic)
- Ones you define yourself

Even though modern computers are extremely fast you still need to be able to think carefully, clearly, algorithmically.

Algorithmic thinking takes simple computations and turns them into something more powerful.

Good algorithm design is crucial.

#### Storage

Chess example: there are ~10^123 possible chess games (10^80 total atoms in the universe, so that is **a lot**) - which means we can't store _all_ information in one computer - have to be clever about how we solve the problems.

### Algorithms and complexity

Some things are still just too much for computes to do.

Sometimes this works in our favor (e.g. encryption schemes)

There are some theoretically impossible problems

e.g. Turing halting problem: not possible in all cases to write a program that can take any other program as input and tell me if it will always work.

## Knowledge

How do we get a computer to do things for us?

Begin by thinking about what do we want it to do? To compute something, obviously, but...

What's the knowledge it's going to use to do that computation?

### Two types of knowledge
- Declarative
- Imperative

Declarative: statements of fact/truth, but no instructions on how

Imperative: gives a sequence of steps to find a solution or use the information

Programs give the computer imperative knowledge to solve the problem we're giving them

Declarative: square root of `x` is `y` such that `y * y = x`.

Imperative:

1. Start with guess `g`
2. If `g` is _close enough_ to `x`, stop and say `g` is the answer
3. Otherwise guess again by getting the average of `g` and `x / g`
4. Using the new `g`, repeat the process until you're close enough

### It's like a recipe

- sequence of simple steps
- flow of control process that specifies when each step is executed
- means of determining when to stop

These are the _3 pieces of an algorithm_.

### Algorithms vs. programs

An algorithm is a _conceptual idea_. A program is a _concrete instantiation_ of an algorithm.

## Machines

## Languages

## Types

## Variables

## Operators and Branching