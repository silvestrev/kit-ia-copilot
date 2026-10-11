---
description: Changes an existing area of the code safely (new demand on an old project)
---
<!-- PT-BR: Roteiro seguro para mudar código que já existe: mapear, entender risco, testar o comportamento atual, mudar com o menor diff e rodar o gate. -->
I will ask for a change in code that already exists. Follow this routine and stop at the end of each stage:

1. Map the affected area: files, who uses them (use find-usages/references) and the existing tests.
2. Say what the code does today and what the change could break.
3. If the area has no tests, first propose a test that records the current behavior. Only then change it.
4. Propose the change as the smallest possible diff, following the local pattern even if it is not ideal. Wide refactors only if I ask.
5. Run `bash scripts/gate.sh` and report the result.
6. Mention any non-responsive or accessibility gap you noticed, but do not fix it unless asked.

Desired change:
