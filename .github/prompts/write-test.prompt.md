---
description: Writes tests (RTL and/or Playwright) for the indicated file or flow
---
<!-- PT-BR: Escreve testes para o arquivo ou fluxo indicado seguindo as regras de teste. Não altera código de produção. -->
Write tests for the indicated file or flow.

Rules:
- Follow the repo testing instructions (behavior over implementation, `getByRole`, mock only the edge, `test.each` for variations).
- Cover main flow, error, empty and loading, plus edge cases.
- Run the tests with `npm run test` (never watch mode) and show the result.
- Do not change production code; if you find a bug, describe it instead of fixing it.
