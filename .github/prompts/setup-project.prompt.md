---
description: Fills in the FILL IN fields of .github/copilot-instructions.md by reading the repo and asking me only what is missing
---
<!-- PT-BR: Preenche o copilot-instructions.md por você. Lê package.json e o repo, descobre o que der, pergunta só o que faltar e edita apenas os campos FILL IN. Rode uma vez por projeto. -->
Fill in the `FILL IN` fields of `.github/copilot-instructions.md`.

Steps:
1. Read `package.json`, lockfiles, tsconfig, lint/test configs and a few source files. Detect:
   - project name and what it does (README, if any)
   - stack and versions, and whether React Compiler is used
   - package manager (npm, yarn or pnpm), install command and run command
   - name of the design system package (look in dependencies for a UI/design system library; if unsure, ask me)
   - the `test` script: say if it looks like watch mode
   - folder structure and naming patterns (look at 3 or 4 real files)
2. Ask me, in one single message and in Brazilian Portuguese, ONLY what you could not detect. Typically: is this an internal tool (desktop) or an external product (mobile matters)?
3. After my answer, edit ONLY the `FILL IN` fields in `.github/copilot-instructions.md`. Do not change any other line or any other file.
4. Delete lines you still cannot fill, instead of leaving `<...>` placeholders.
5. Show me what you filled in, and anything you were unsure about.

Do not commit or push.
