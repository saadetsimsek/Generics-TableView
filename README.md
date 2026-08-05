# Generic Table View

*Type safe cell registration and configuration, with no casting at the call site.*

![Swift](https://img.shields.io/badge/Swift-5.0-F05138?style=flat-square&logo=swift&logoColor=white) ![UIKit](https://img.shields.io/badge/UIKit-2396F3?style=flat-square&logo=uikit&logoColor=white) ![iOS](https://img.shields.io/badge/iOS-18.0%2B-000000?style=flat-square&logo=apple&logoColor=white) ![Architecture](https://img.shields.io/badge/pattern-generics-6366F1?style=flat-square) ![Dependencies](https://img.shields.io/badge/dependencies-none-16A34A?style=flat-square)

## Overview

A table view that mixes logo, photo and description cells. The usual approach is a switch statement
full of `as!` casts. This project removes the casts entirely by making the relationship between a
cell and its data a compile time fact.

## The mechanism

```mermaid
flowchart TD
    P1["protocol ConfigurableCell<br/>associatedtype DataType<br/>func configure(data:)"]
    P2["protocol CellConfigurator<br/>reuseId, configure(cell:), register(tableView:)"]
    GEN["TableCellConfigurator&lt;CellType, DataType&gt;<br/>where CellType.DataType == DataType"]
    P1 --> GEN
    P2 --> GEN
    GEN --> C1["LogoTableViewCell<br/>DataType = LogoModel"]
    GEN --> C2["PhotoTableViewCell<br/>DataType = UIImage"]
    GEN --> C3["DescriptionTableViewCell<br/>DataType = String"]
    VM["ViewModel<br/>[CellConfigurator]"] --> GEN
    VC["ViewController"] --> VM
```

The generic constraint `CellType.DataType == DataType` is what makes this work. It tells the compiler
that a configurator can only ever pair a cell with the data type that cell declared, so a mismatch is
a build error rather than a crash.

## Registration and dequeue

```mermaid
sequenceDiagram
    participant VC as ViewController
    participant VM as ViewModel
    participant CFG as TableCellConfigurator
    participant TV as UITableView

    VC->>VM: read the configurator array
    loop for each configurator
        VC->>CFG: register(tableView)
        CFG->>TV: register(CellType.self, forCellReuseIdentifier:)
    end
    VC->>TV: dequeue with configurator.reuseId
    TV-->>VC: a cell
    VC->>CFG: configure(cell:)
    CFG->>CFG: cast once, inside the generic type
```

The single cast that remains lives inside the generic configurator, where the constraint guarantees
it succeeds. Call sites never see it.

## Implementation notes

- **The array is heterogeneous, the elements are not.** `[CellConfigurator]` holds configurators of
  different concrete types behind a protocol, while each one stays fully typed internally.
- **Registration derived from the type.** The reuse identifier comes from the cell type itself, so it
  cannot drift out of sync with the registration.
- **Adding a cell type is additive.** A new cell conforms to `ConfigurableCell` and appears in the
  array. No existing code changes.

## Project structure

```
GenericsTableView/
├── CellConfigurator.swift        the protocols and the generic configurator
└── MainModule/
    ├── Models/       LogoModel
    ├── Views/
    │   ├── Cells/    LogoTableViewCell, PhotoTableViewCell, DescriptionTableViewCell
    │   └── ViewModels/ ViewModel
    └── ViewController.swift
```

## Requirements

Xcode 15 or later, iOS 18.0 or later. No external dependencies.
