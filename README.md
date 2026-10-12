# Kit de IA (Copilot no VS Code)

Os arquivos do kit estão em inglês (a IA gera código melhor assim). Cada um tem um comentário em português no topo explicando o que faz. Este README fica em português.

Copie as pastas `.github`, `docs` e `scripts` para a raiz do projeto.
Atenção: `.github` é pasta oculta. No Mac use Cmd+Shift+. no Finder; no VS Code ela aparece normalmente.

## O que cada arquivo faz

| Arquivo | Para que serve | Quando é usado |
|---|---|---|
| `.github/copilot-instructions.md` | Contexto do projeto (stack, comandos, convenções, regras de trabalho) | Automático, em todo chat do Copilot |
| `.github/instructions/*.instructions.md` | Regras extras por tipo de arquivo (ex.: testes) | Automático, quando o arquivo bate com o `applyTo` |
| `.github/prompts/*.prompt.md` | Receitas reutilizáveis | Você digita `/` + nome no chat (ex.: `/spec`) |
| `.github/agents/*.agent.md` | Papéis (implementer, reviewer, explainer, auditor) | Você escolhe o agente no seletor do chat |
| `docs/specs/_template.md` | Modelo de spec | Usado pelo `/spec` |
| `scripts/gate.sh` | Roda lint, typecheck e testes | Pelo agente ao fim de cada passo, ou por você |

## Prompts (slash commands)

- `/explain`: explica uma área do código e propõe 2 ou 3 opções, antes de qualquer spec (não edita nada)
- `/spec`: transforma seu briefing em uma spec
- `/plan`: quebra a spec em passos pequenos
- `/implement-step`: implementa um passo e roda o gate
- `/review`: revisa o diff contra a spec (use em chat novo)
- `/new-component`: cria componente seguindo o design system
- `/write-test`: escreve testes
- `/context-summary`: resume o estado para continuar em outro chat
- `/map-design-system`: lê o pacote do design system em node_modules e gera `docs/design-system.md` (faça uma vez e refaça quando o design system atualizar)
- `/audit-project`: audita o projeto: o que está bom, o que está ruim, que erros podem acontecer, responsividade e o que melhorar (não edita nada; use o agente `auditor`)
- `/check-design-system`: auditoria de design system: confere se o código atual (arquivo, pasta, `projeto inteiro` ou o que você mudou) usa o design system do jeito certo: componentes, props, tokens e estados (não edita nada; rode depois do `/map-design-system`)
- `/explain-finding`: aprofunda UM problema da auditoria (ex.: `/explain-finding P3`): o que é, por que importa, quando ignorar, como corrigir e qual comando rodar depois (não edita nada)
- `/perf-review`: investiga lentidão ou re-renders: medir, mover estado para baixo e só então memoizar
- `/setup-project`: preenche os campos FILL IN do `copilot-instructions.md` lendo o repo e perguntando só o que faltar (rode uma vez por projeto)
- `/map-project`: explora um projeto existente e propõe o preenchimento das instruções
- `/change-existing-code`: roteiro seguro para mudar código que já existe

## Primeiro uso

1. Rode `/setup-project` no chat do Copilot para preencher `.github/copilot-instructions.md` (ou preencha os FILL IN à mão).
   Em projeto existente, rode `/map-project` e cole o resultado.
2. Rode `bash scripts/gate.sh` para ver se o gate funciona no projeto.
3. Para cada tarefa: briefing, `/explain` (se você não souber como resolver), `/spec`, `/plan`, `/implement-step`, `/review` em chat novo.
   Dica: para conversar e tirar dúvidas ("por quê?"), escolha o agente `explainer` no seletor do chat.
