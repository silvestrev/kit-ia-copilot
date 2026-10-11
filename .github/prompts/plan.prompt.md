---
description: Generates the plan in small steps from the approved spec
---
<!-- PT-BR: Quebra a spec aprovada em passos pequenos (1 passo = 1 commit). Não implementa. -->
Read the indicated spec and fill in the "Plan" section.

Rules:
- List files and components that will be changed or created.
- Reuse design system components and existing patterns.
- Say where each piece of state will live, and flag any risk of large re-renders.
- Include responsive behavior for new UI according to the product type (desktop widths for internal tools; mobile and desktop for external products).
- Small steps: each one must fit in one commit and be verifiable.
- Suggested order: types -> component -> integration -> tests.
- Do not implement anything. Stop and wait for my approval.
