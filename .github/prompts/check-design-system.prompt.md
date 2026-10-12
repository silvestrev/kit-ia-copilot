---
description: Checks whether the code I just wrote (or a given file/folder) follows the design system correctly; does not compare with old code
---
<!-- PT-BR: Confere se o código ATUAL (o que você acabou de fazer, ou um arquivo/pasta) usa o design system do jeito certo. Não compara com código antigo. Não edita nada. Rode em chat novo, depois do /map-design-system. -->
Check whether the code I indicate uses the design system correctly. Do not edit any file. Answer in Brazilian Portuguese. Judge the code as it is NOW; do not compare it with older code or with how other screens were done.

What to check, in this order:
1. Choose the target: the text I wrote after the command (files, folder or component). If I wrote nothing, use my uncommitted changes (`git diff` and new untracked files). If there are none, ask which file to check and stop.
2. Read the design system reference: the design system map file mentioned in the project instructions (for example `docs/design-system.md`). If there is none, say so and tell me to run `/map-design-system` first. Then read the real source of each design system component used, to confirm props and variants. Do not trust the map blindly.
3. Check each point and cite file and line:
   - A design system component already exists for what I built, but I recreated it with custom markup or styles.
   - Right component, wrong usage: props, variants, sizes, composition or required children used incorrectly.
   - Hardcoded colors, spacing, font sizes, radii or shadows where a token exists. Name the correct token.
   - Missing states: hover, focus, disabled, loading, error, empty.
   - Overrides of the component's internal styles (`!important`, deep selectors) that fight the design system.
   - Accessibility the component already provides but I broke (labels, roles, focus).
   - Layout for the product's target (desktop widths and zoom, or mobile) built with fixed pixel sizes instead of the design system's layout/grid pieces.
4. Do not invent problems. If something is correct, say it is correct. If you cannot confirm it, write "not confirmed" and say how to check (Figma, a teammate, the browser).

Output:
- **Veredito**: 2 lines, follows the design system / follows with issues / does not follow, with the main reason.
- **Está certo**: what is correctly done, with evidence.
- **Ajustes**: table with ID (D1, D2...), what, where (file:line), what the design system offers instead (component or token), severity (high/medium/low).
- **Para cada ajuste médio ou alto**: why it matters, the smallest fix as before/after, and how to verify.
- **Não confirmado**: what only the Figma or the browser can confirm.
- **Próximo passo**: if there are fixes, the command to apply them, e.g. `/change-existing-code fix D1 and D2 from the design system check`.

Files or folder to check (empty = my uncommitted changes):
