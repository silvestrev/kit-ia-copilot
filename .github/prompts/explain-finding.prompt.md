---
description: Explains one audit finding in depth (what, why, when to ignore, how to fix, how to verify) without editing code
---
<!-- PT-BR: Aprofunda UM problema da auditoria (ex.: P3). Não edita nada. Use no mesmo chat da auditoria ou cole o problema depois do comando. -->
Take the finding I indicate (an ID like P3, or the pasted text). Do not edit any file.

Re-read the real code involved and answer in Brazilian Portuguese, in this order:
1. **O que é**: explain like I am a new teammate, with the exact snippet and file:line. Say if the audit was wrong or exaggerated.
2. **Por que importa**: a concrete scenario of how it breaks or hurts, and whether it can happen today.
3. **Vale mexer agora?**: yes / with another task / no, with the reason, given the product type and the team's risk.
4. **Como corrigir**: the smallest safe fix in steps, with before/after code, plus a bigger option if one exists and when it is worth it.
5. **Como verificar**: tests to add or run (`npm run test`), and what to check by hand.
6. **Risco**: what could break and which files depend on this code.
7. **Próximo passo**: the exact command to run next (`/spec ...` or `/change-existing-code ...`), already filled with the context.

Finding:
