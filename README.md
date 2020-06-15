# Hypertap iOS

Simple iOS user attribution


#### Usage

1. Create attribution links on [hypertap.co](https://hypertap.co/)

2. Add [Hypertap.swift](Hypertap.swift) to your XCode project

3. To attribute new users use following code snippet:

```swift
Hyper.tap { linkID, channel in
    print(linkID, channel)
}
```
