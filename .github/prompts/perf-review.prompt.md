---
description: Investigates slowness or too many re-renders in a screen (measure, reduce blast radius, then memoize)
---
<!-- PT-BR: Roteiro para investigar lentidão: medir, achar o componente caro, mover o estado para baixo e só então memoizar. Não edita sem aprovação. -->
Investigate the performance problem I describe. Do not edit anything until I approve.

1. Say how to measure it without installing anything: the browser Performance tab (long tasks), React's built-in `<Profiler>` component with an `onRender` console log, or render counts via `console.log` (remember Strict Mode doubles them in dev). Say which numbers to compare before and after, and remind me to remove the temporary measuring code and not commit it.
2. Read the code and find where the state lives and which components re-render because of it.
3. Rank the causes by likely impact: state too high, big Context, inline handlers on memoized children, expensive work in render, huge lists, large bundle.
4. Propose fixes in this order: move state down, isolate state + dependent UI in a small component and pass the rest as `children`, then useMemo/memo only for what is measured. Check whether React Compiler is used first.
5. Answer in Brazilian Portuguese and mark what you could not confirm without running the app.

Screen or problem:
