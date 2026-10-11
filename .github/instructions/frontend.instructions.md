---
applyTo: "**/*.{ts,tsx,css}"
---
<!-- PT-BR: Regras de front-end aplicadas automaticamente a arquivos .ts/.tsx/.css (design system, estado, effects, listas, performance, responsividade). -->
# Front-end rules

## Design system and structure
- Reuse design system components before creating a new one. Tokens (colors, spacing, typography) come from the design system; no loose values.
- Small components with one responsibility; extract logic into hooks.
- Required states: loading, error, empty, success.
- No `any`; typed props.

## State
- Keep state as close as possible to where it is used. Do not lift local UI state (modal open, input text) into global Context or a store.
- Never initialize `useState` from props (it gets stuck on the first value). Use a controlled component, or an explicit reset (`key`).
- Never mutate state. Create a new array/object and use functional updates when the next value depends on the previous one.
- Render, initializers and state updaters must be pure (Strict Mode runs them twice in dev).

## Lists and events
- Use a stable, unique `key` (an id). Never the array index in dynamic lists.
- An inline handler passed to a memoized child defeats the memo. Use a stable handler or let the child handle its own event.

## Effects and data
- Use `useEffect` only for real side effects (subscriptions, DOM, timers). Always clean up. Use `AbortController` for fetch.
- Do not derive state in an effect; compute it during render.
- If a fetch/effect pattern repeats, extract a custom hook, or use the data layer the project already has.

## DOM and security
- Do not spread arbitrary props onto DOM elements (`{...props}`). Declare allowed props or extend the HTML element types.
- Sanitize anything passed to `dangerouslySetInnerHTML`.

## Context
- Split contexts by subject (user, theme...). Memoize the context `value`. Fast-changing state does not belong in Context.

## Performance
- Measure first. Long tasks freeze the page; avoid unnecessary re-renders before anything else.
- First fix: move state down to the component that uses it, or wrap state + dependent UI in a small component and pass the rest as `children`.
- Check whether the project uses React Compiler. If yes, do not add manual `memo`/`useMemo`/`useCallback`. If no, use them only for a measured problem, and memoize every prop (including `children`).
- Debounce search inputs. Expensive computations (filter/sort of large lists) go in `useMemo` with correct deps.

## Accessibility
- Semantic elements, `label` on inputs, visible focus, keyboard navigation.

## Responsiveness
- The target depends on the product type in `copilot-instructions.md`: internal tool = desktop (1280 to 1920px+, zoom up to 150%); external product = mobile-first plus desktop.
- Use flex/grid and relative units (`rem`, `%`, `fr`, `clamp`), `min-width`/`max-width`, not fixed `px` widths for containers or panels.
- Breakpoints come from the design system tokens if they exist; do not invent new ones.
- No overlap, clipped text or accidental horizontal scroll anywhere in the target range. Tables, side panels and toolbars need a strategy when the width shrinks (scroll container, wrapping, collapsing, truncation with tooltip).
- Do not assume a fixed viewport height; use `min-height` and scrollable regions instead of `height: 100vh` with hidden overflow.
- External products only: touch targets at least 44x44px and a layout check at 360px.
- Check the layout at 1280, 1440 and 1920px (plus 360 and 768 for external products) before saying done.
