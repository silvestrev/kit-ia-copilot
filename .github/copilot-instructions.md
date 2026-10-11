<!-- PT-BR: Contexto fixo do projeto. O Copilot lê este arquivo automaticamente em todo chat. Preencha os campos FILL IN uma vez (ou rode /map-project em projeto existente). -->
# Project instructions

## Project (FILL IN)
- What it is: <1 line>
- Stack: <e.g. React, TypeScript, Styled Components, RTL, Playwright>
- Design system: <FILL IN name> (package in node_modules; exact package name: <FILL IN>)
- Design system catalog: `docs/design-system.md`. Before creating any UI component, check the catalog and use the design system component if one exists. If the catalog does not exist, run `/map-design-system`.

## Commands (FILL IN)
- Install: `<command>`
- Run: `<command>`
- Tests: `npm run test` (runs once). NEVER run watch mode: it never exits and hangs the agent.
- Gate (lint + typecheck + tests): `bash scripts/gate.sh`

## Conventions (FILL IN)
- Folder structure: <how features/components are organized>
- Naming: <components, hooks, files>
- Styling: reuse design system components before creating new ones
- Types: no `any`; type props and API responses

## Language
- Code in English: variable, function, component, file and type names, and code comments.
- Do NOT commit or push. I make the commits myself. If I ask for a commit message suggestion, write it in Brazilian Portuguese, short, imperative mood (e.g. "Adiciona estado vazio na lista de ordens").
- End-user visible text follows the language the project already uses; if unsure, ask.
- Chat replies and explanations to me: Brazilian Portuguese.

## How to work (applies to every task)
1. Before editing, read the related code and explain the plan. Do not edit without approval.
2. Work in small steps; each step must fit in one commit.
3. Respect the "Out of scope" section of the brief. If something out of scope seems necessary, ask.
4. Follow the patterns already in the repo; do not introduce a new library or pattern without asking (see "Standards and precedence").
5. After each step run `bash scripts/gate.sh` and only say "done" if it passes.
6. If information is missing (error case, empty state, permissions), list questions instead of inventing.
7. Do not optimize performance without measuring first (the browser Performance tab, React's built-in `<Profiler>` component with a temporary console log, or render counts via console.log; do not assume the React DevTools extension is installed). Remove any temporary measuring code before finishing.

## Standards and precedence
<!-- PT-BR: Define quem vence quando o padrão do repo e as regras do kit divergem. Preencha "Target standard" se quiser adotar um padrão novo de propósito. -->
When rules conflict, follow this order:
1. The spec or brief for the current task.
2. The "Target standard" below (if filled in).
3. The pattern already used in the surrounding code.
4. The general rules in `.github/instructions/*.instructions.md`.

- Target standard for NEW code (FILL IN or delete): <e.g. local state first, no `any`, small components, feature folders>
- Known legacy patterns not to copy (FILL IN or delete): <e.g. "orders module uses global Context for everything">
- New files and new functions follow the target standard. Existing code keeps its local pattern unless the spec asks for a refactor.
- Never mix two patterns inside the same file. If the file is legacy, stay consistent with it and mention the gap in your report.
- If I ask to adopt a different pattern on purpose (a new library, structure or convention), do it, but first list which files it affects and migrate step by step: one area per step, tests green at each step.

## Responsiveness
- Product type (FILL IN): internal tool (desktop) | external product (mobile matters)
- Internal tool: desktop is the target. It must work well from small laptops (1280px) to large monitors (1920px+), at browser zoom 100-150%, and when the window is resized. Mobile is not required.
- External product: mobile-first. Must also work well on desktop.
- Either way, no broken layout inside the target range: no overlap, no clipped content, no accidental horizontal scroll, tables and panels adapt to the width.
- In existing screens with poor responsiveness, do not rewrite the layout unless the spec asks for it; mention the gap in your report.

## Never
- Never rewrite whole files without need.
- Never delete or weaken tests to make them pass.
- Never commit secrets, tokens or .env.
