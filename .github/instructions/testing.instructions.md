---
applyTo: "**/*.{test,spec}.{ts,tsx,js,jsx}"
---
<!-- PT-BR: Regras de teste aplicadas automaticamente a arquivos de teste (RTL, Jest, Playwright). -->
# Testing rules

## Principles
- Test behavior visible to the user, not implementation details. Each test is independent and has a descriptive title.
- Cover: main flow, error state, empty state, loading state, and edge cases.
- Coverage is a guide, not a goal of 100%. Prioritize critical paths.
- Update tests when the code changes. Never weaken or delete asserts to pass.
- Never leave `.only` in a test. Avoid `.skip`; if one is unavoidable, add a comment with the reason.

## React Testing Library
- Prefer `getByRole` and `getByLabelText`; avoid `getByTestId` when an alternative exists.
- Use `userEvent` and `findBy*`/`waitFor` for async UI; never fixed sleeps.
- For components that need Context, use a small test provider (e.g. a mock auth provider). For protected routes, use `MemoryRouter`.

## Jest mocks
- Prefer real implementations. Mock only the edge (API/network, timers, browser APIs), never the component under test.
- `jest.fn()` for function props; `jest.mock()` for modules; `jest.spyOn()` and restore it.
- Clean up between tests (`restoreAllMocks` / `clearAllMocks`). Keep mock data realistic.
- Use `test.each` with descriptive titles for parameterized cases.

## E2E (Playwright)
- One test per critical flow, selectors by role/text. For responsive screens, test at least one mobile viewport.
