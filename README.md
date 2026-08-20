# Banka Docking Protocol

**Draft version:** `0.1.0-draft`

**The preparation protocol for adopting Banka in an existing project.**

Docking brings an existing or brownfield project to the point where Banka can
safely begin its own adoption process. It establishes the project's actual
state, determines what—if anything—must be resolved before handoff, and produces
an `ADOPTION-ASSESSMENT.md` that records the evidence and readiness decision.

Docking does not itself adopt Banka. It prepares the project; Banka remains
authoritative for what happens after handoff.

**Docking prepares. The assessment verifies readiness evidence. Banka adopts and operates.**

```text
Existing project
      ↓
Want to adopt Banka
      ↓
Banka Docking
      ↓
Adoption assessment
      ↓
Is decision-ready scope present?
   ├── no → clarify scope → reassess
   └── yes
            ↓
Blocking readiness work?
   ├── yes → minimal readiness work → reassess
   └── no
            ↓
      Ready for Banka
            ↓
      Owner chooses
       ├── stop → keep the assessment
       └── continue → handoff to Banka
                           ↓
                    Banka adoption begins
```

## What it does

The protocol begins read-only. It separates observed facts, user statements,
and assumptions; distinguishes local, preview/staging, and production evidence;
classifies findings; and identifies only the minimal readiness work needed for a
truthful, safe handoff. It stops after delivering the assessment and, when the
owner chooses, a handoff package.

**The assessment is independently useful.** The owner may stop after Docking
with a durable record of project reality, evidence, readiness findings, risks,
and stabilization needs without continuing to Banka.

Use the [canonical protocol](protocol/BANKA-DOCKING.md), start from the
[assessment template](templates/ADOPTION-ASSESSMENT.md), and review the
[sanitized examples](examples/clear-scope-existing-project/ADOPTION-ASSESSMENT.md).

## What it does not do

It is not a migration engine, modernization framework, general cleanup system,
deployment workflow, or ongoing project-management system. It does not install
Banka, choose a Banka tier, generate Banka-managed state, run a stabilization
backlog, or imply authority to mutate production.

## Status vocabulary

<!-- STATUS-VOCABULARY:START -->
- `Discovery in progress`
- `Scope clarification required`
- `Readiness work required`
- `Ready for Banka`
- `Handed off`
- `Stopped by owner`
<!-- STATUS-VOCABULARY:END -->

These statuses describe this protocol's assessment and handoff only. `Ready for
Banka` is not a claim that Banka adoption is complete.

## From Docking to Banka adoption

Docking prepares an existing project for Banka; it does not perform Banka
adoption.

If purpose and intended outcome are materially unclear, Docking explains what
scope information is missing, pauses readiness work, and offers proportionate
clarification options for the owner to choose.
[ASMP](https://github.com/partikularwaters/adaptive-scope-mapping-protocol) is
one optional route; owner-supplied clarification or any decision-ready charter,
specification, brief, decision record, or other scope source is also acceptable.

If Blockers or Readiness requirements exist, perform only the authorized work
required to resolve them. Put all other valuable work in the Stabilization
backlog.

When the project is `Ready for Banka`, the owner may stop with the completed
assessment or elect to continue. If they continue, use the
[Banka handoff](handoff/BANKA-HANDOFF.md). From that point, current Banka
determines its own tier, files, skills, runtime behavior, and adoption process.

## Production, secrets, and private evidence

Local, preview/staging, and production are separate realities. Do not treat a
clean checkout as production proof. Record credential locations and handling
rules, never values; redact private evidence from public artifacts. Before any
risky production proposal, require explicit authority, ownership, backup,
rollback, and verification. This protocol itself performs no production
mutation or deployment.

## Repository checks and draft status

Run `sh scripts/check-repo-integrity.sh`. The check covers repository structure,
relative Markdown links, assessment naming, status vocabulary, selected
secret-shaped patterns, and known copy-regression markers. It cannot prove that
prose is correct, evidence is complete, data is non-sensitive, or external
protocols have not changed; human review remains required.

`0.1.0-draft` is the first public field-testing version of Banka Docking.
The protocol has been validated against one real brownfield software project
and remains pre-1.0 while additional project shapes are tested. See
[LICENSE](LICENSE) and [CHANGELOG.md](CHANGELOG.md).