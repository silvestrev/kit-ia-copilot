---
description: Audits the current project (or a folder) - what is good, what is bad, what to improve, what errors can happen, responsiveness
---
<!-- PT-BR: Auditoria do projeto atual. Não edita nada. Entrega: o que está bom, o que está ruim, o que melhorar, que erros podem acontecer e como está a responsividade. Rode em chat novo; informe uma pasta se quiser limitar o escopo. -->
Audit this project (or only the folder I indicate). Do not edit any file. Base everything on real code; cite file and line; mark anything unverified as "not confirmed".

Look at, in this order:
1. Structure: folders, naming, separation of features/components/hooks/services, duplicated code.
2. State and data: where state lives, state lifted too high, state initialized from props, mutation, derived state in effects, fetching in effects without cleanup, caching.
3. Rendering and performance: large lists, index as key, inline handlers on memoized children, fat Contexts, expensive work in render, heavy bundles, lack of lazy loading. Check whether React Compiler is used.
4. Design system: duplicated components, hardcoded colors/spacing instead of tokens. For a deep design system audit, tell me to run `/check-design-system projeto inteiro` after this one.
5. TypeScript: `any`, loose types, unchecked API responses.
6. Tests: what is covered, what critical flow has no test, weak or skipped tests, over-mocking, flakiness risks.
7. Accessibility: semantics, labels, focus, keyboard.
8. Responsiveness: first identify whether the product is an internal tool (desktop target) or external (mobile matters). For desktop check 1280 to 1920px, zoom up to 150% and window resize: fixed px widths, `100vh` with hidden overflow, overlapping or clipped content, tables/panels/toolbars that do not adapt. For external products also check 360px, touch targets and viewport meta. State how responsive the project is overall.
9. Security and robustness: `dangerouslySetInnerHTML`, spread props on DOM, secrets, unhandled errors, missing error boundaries, empty/error/loading states.

Output format (Brazilian Portuguese):
- **Resumo**: 3 lines, overall health (good / ok / risky) with the main reason.
- **O que está bom**: only real strengths, with evidence.
- **Quadro de problemas**: table with ID (P1, P2...), problem, where (file:line), severity (high/medium/low), effort (small/medium/large).
- **Detalhe de cada problema**: for EVERY medium or high item (and low ones only if cheap), give this card. Never just list it in one line:
  - **O que é**: plain explanation, no jargon, with the exact code snippet (max 10 lines).
  - **Por que importa**: the concrete symptom for the user or the team (e.g. "list loses input focus when sorted"), and how likely it is.
  - **Quando ignorar**: the situation where this is fine and not worth touching (be honest; "medium" often means "ok for now").
  - **Como corrigir**: the smallest fix, as steps, with a before/after snippet.
  - **Como verificar**: how to confirm it is fixed (test, command, or what to look at in the browser).
  - **Risco de mexer**: what could break, and which tests protect it.
  - **Próximo passo**: the exact command to run next, e.g. `/spec fix P3 ...` for anything beyond a one-file change, or `/change-existing-code` for a small one.
- **Erros que podem acontecer**: only the ones not already covered above.
- **Responsividade**: current state for the product's target (desktop or mobile) and the cheapest fixes first.
- **Ordem sugerida**: quick wins first, then larger refactors. Mark each as "fazer agora", "fazer junto com outra tarefa" or "pode esperar".
- **Não confirmado**: what you could not verify and who to ask.

Scope (empty = whole project):
