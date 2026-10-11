---
description: Audits the current project (or a folder) - what is good, what is bad, what to improve, what errors can happen, responsiveness
---
<!-- PT-BR: Auditoria do projeto atual. Não edita nada. Entrega: o que está bom, o que está ruim, o que melhorar, que erros podem acontecer e como está a responsividade. Rode em chat novo; informe uma pasta se quiser limitar o escopo. -->
Audit this project (or only the folder I indicate). Do not edit any file. Base everything on real code; cite file and line; mark anything unverified as "not confirmed".

Look at, in this order:
1. Structure: folders, naming, separation of features/components/hooks/services, duplicated code.
2. State and data: where state lives, state lifted too high, state initialized from props, mutation, derived state in effects, fetching in effects without cleanup, caching.
3. Rendering and performance: large lists, index as key, inline handlers on memoized children, fat Contexts, expensive work in render, heavy bundles, lack of lazy loading. Check whether React Compiler is used.
4. Design system: duplicated components, hardcoded colors/spacing instead of tokens.
5. TypeScript: `any`, loose types, unchecked API responses.
6. Tests: what is covered, what critical flow has no test, weak or skipped tests, over-mocking, flakiness risks.
7. Accessibility: semantics, labels, focus, keyboard.
8. Responsiveness: first identify whether the product is an internal tool (desktop target) or external (mobile matters). For desktop check 1280 to 1920px, zoom up to 150% and window resize: fixed px widths, `100vh` with hidden overflow, overlapping or clipped content, tables/panels/toolbars that do not adapt. For external products also check 360px, touch targets and viewport meta. State how responsive the project is overall.
9. Security and robustness: `dangerouslySetInnerHTML`, spread props on DOM, secrets, unhandled errors, missing error boundaries, empty/error/loading states.

Output format (Brazilian Portuguese):
- **Resumo**: 3 lines, overall health (good / ok / risky) with the main reason.
- **O que está bom**: only real strengths, with evidence.
- **O que está ruim**: table with problem, where (file:line), severity (high/medium/low).
- **Erros que podem acontecer**: for each relevant problem, the concrete symptom (e.g. "list flickers and loses input focus when sorted because of index keys") and how likely it is.
- **Responsividade**: current state for the product's target (desktop or mobile) and the cheapest fixes first.
- **O que melhorar**: quick wins first, then larger refactors, in suggested order. Say which ones are worth doing now and which can wait.
- **Não confirmado**: what you could not verify and who to ask.

Scope (empty = whole project):
