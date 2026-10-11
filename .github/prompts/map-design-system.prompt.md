---
description: Generates the design system catalog (docs/design-system.md) by reading the package in node_modules
---
<!-- PT-BR: Lê o pacote do design system em node_modules e gera docs/design-system.md. Faça uma vez e refaça quando o design system atualizar. -->
Create `docs/design-system.md` with the catalog of the design system, by reading the installed package.

Steps:
1. Find the design system package in `package.json` (use the name given in `.github/copilot-instructions.md`; if it is not filled in, ask me) and read its files in `node_modules/<package>`: types (`.d.ts`), exports, examples, README and stories if they exist.
2. Find out how the project imports the design system by reading screens that already use it (look at 3 or 4 real examples).
3. Write the catalog with: package name and version, how to import, and one section per component with main props (name, type, required or not), variants and a usage example copied from what the project already does.
4. Include a tokens section (colors, spacing, typography, breakpoints) if the package exposes them.

Rules:
- Do not invent anything that is not in the package or the project code. If unsure about a behavior, mark it "to confirm".
- Do not edit project code; only create the documentation file.
- At the end, list the components you could not understand well.
