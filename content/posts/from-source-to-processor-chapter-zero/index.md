+++
title = 'From Source to Processor: Chapter Zero'
date = 2025-04-06T20:06:28+02:00
draft = false
summary = 'In this series From Source to Processor I’ll be diving into what happens behind the scenes when you run a program. We’ll go from high-level code to the instructions that a processor actually understands and executes'
+++

**Hello, world!** This is my very first blog post, and honestly, I’m a bit excited.
In this series *From Source to Processor* I’ll be diving into what happens behind the scenes when you run a program. We’ll go from high-level code to the instructions that a processor actually understands and executes.

But why did I decide to start a blog? Mainly for three reasons:
- It’s a way to force myself to organize my university notes
- Trying to explain concepts in a simple way will help me master them better (Feynman technique)
- I hope it can help someone else clarify their ideas, or maybe even discover a topic worth diving into

In this first post, I want to provide an introduction to what we will see in the upcoming posts and give an idea of how it’s all structured. I hope to get some useful feedback to improve future posts or the overall structure. For that reason, I can also point you to this same article published on Medium, where it might be easier to leave comments or receive notifications when I publish a new article.

![Computer wizard](img/from-source-to-processor-chapter-zero/computer-wizard.png)

# Computer Science/Magic

Unlike a magician, I will reveal the tricks behind the show of programming. We might say that my goal is to make programming less magical and more understandable. I like to think that programming is an art, not magic.

Together, we’re going to explore what happens after you hit **Run** on a program written in a high level language. Behind that single action hides a world of transformations, abstractions, and clever tricks that make modern computing possible.

Here’s a quick overview of the main topics we’ll dive into:

- **Compilation & Interpretation**
    First, we’ll look at what happens to the source code, how it gets turned into instructions the machine can understand. This transformation depends on both the programming language you use and the kind of processor you’re targeting.
    We’ll explore the two big families of languages: compiled and interpreted, and see how they differ in the way they turn code into action.

- **The Operating System’s Role**
    Once the code is ready to run, the operating system steps in. It loads the program into memory, sets up the environment it needs, and manages the resources required during execution.
    This part of the journey is where we’ll also discuss how memory is managed, and how the OS creates the illusion that each program is running alone.

- **Concurrency & Execution Models**
    Programs don’t always do things one at a time, in fact, many of them are built to do multiple things at once. We’ll talk about how single thread programs can still multitask using tricks like event loops, and how multi thread programs create separate flows of execution.
    We’ll also see why writing concurrent code is hard: when multiple parts of a program try to work together, they need to stay in sync and that’s where things like synchronization come in.

- **What the Processor Actually Does**
    Finally, we’ll peek inside the CPU itself. Once the program is in memory and ready to run, the processor starts doing its job: reading instructions, understanding what they mean, and executing them step by step.
    We’ll explore how it keeps track of where it is, how it uses internal shortcuts like registers and caches, and how modern processors use all kinds of clever techniques (like predicting what’s coming next) to go faster.