# Test Quality (JUnit 5 + AssertJ)

**Load**: Ask OpenCode to use the `test-quality` skill

---

## Description

Helps OpenCode suggest meaningful JUnit tests and improve test coverage for Java projects.

---

## Use Cases

- "Add tests for PluginManager.loadAll()"
- "Review existing tests in PluginLoaderTest"
- "Improve test coverage for lifecycle module"

---

## Examples

```
> "Use the test-quality skill"
> "Add unit tests for ExtensionFactory with edge cases"
→ Generates JUnit 5 tests with AssertJ assertions
```

---

## Notes / Tips

- Works best when class/method signatures are available
- Can suggest missing edge cases or null checks
