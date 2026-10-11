---
description: Implements ONE step of the plan and runs the gate
---
<!-- PT-BR: Implementa apenas um passo do plano, roda o gate e para. Você faz o commit. -->
Implement only the plan step I indicate (if I do not indicate one, the next incomplete step).

Rules:
- Respect "Out of scope" in the spec.
- Follow the repo instructions and existing patterns.
- When done, run `bash scripts/gate.sh`. If it fails, fix and run again.
- Do not commit or push.
- Reply with: what changed (files), gate result and any question.
- Do not move to the next step until I ask.
