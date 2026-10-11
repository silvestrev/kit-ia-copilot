---
description: Critical review of the diff against the spec (run in a NEW chat)
---
<!-- PT-BR: Revisão crítica do diff contra a spec. Rode em chat novo para a IA não revisar o próprio raciocínio. Usa o checklist do agente reviewer. -->
You are a reviewer. Compare the current changes (diff) with the indicated spec.

Check, in this order:
1. Scope: was anything changed outside the scope?
2. Acceptance criteria: is each one covered? Point out those that are not.
3. Design system: was a component or style duplicated without need?
4. Edge cases: error, empty, loading.
5. Tests: do they cover the flow? Was any weakened, skipped or over-mocked?
6. React checklist: see the `reviewer` agent (state, keys, effects, Context, memo, re-render risk).
7. Quality: types, accessibility, responsiveness for the product target, names, dead code.

Format (Brazilian Portuguese): list of problems by severity (blocks / should fix / suggestion), each with file and line.
Do not edit any file.
