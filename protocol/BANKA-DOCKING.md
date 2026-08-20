# Banka Docking Protocol

**Version:** `0.1.0-draft`  
**Status:** Pre-1.0 draft

## Purpose and boundary

Banka Docking is the preparation stage for adopting Banka in an existing or
brownfield project.

Docking establishes the project's actual state, verifies readiness evidence,
performs only the minimal authorized work required for a truthful and safe
handoff, and optionally hands the resulting evidence to current Banka.

Its primary output is `ADOPTION-ASSESSMENT.md`. The assessment is independently
valuable and may be the final output.

Docking does not itself adopt Banka. Actual Banka adoption begins only after
handoff, under Banka's own authority. This protocol does not own long-term
stabilization, modernization, refactoring, feature work, Banka installation or
tiering, deployment, production mutation, or ongoing project management.

## Core terms

- **Docking** — the preparation process for bringing an existing project to a
  truthful and safe Banka handoff.
- **Readiness evidence** — the evidence Docking evaluates and establishes before
  a project may be declared `Ready for Banka`.
- **Banka adoption** — the downstream process governed by Banka after handoff;
  Docking does not perform or complete it.

## Status vocabulary

<!-- STATUS-VOCABULARY:START -->
- `Discovery in progress`
- `Scope clarification required`
- `Readiness work required`
- `Ready for Banka`
- `Handed off`
- `Stopped by owner`
<!-- STATUS-VOCABULARY:END -->

`Ready for Banka` means the assessment is complete and all Blockers and Readiness
requirements are resolved. Open Stabilization backlog items may remain when they
are explicitly recorded with proposed ownership and priority. Only Banka may
establish the project's Banka tier, files, skills, runtime guidance, or adopted
state.

## Evidence and authority rules

- Begin read-only. Inspect before proposing changes.
- Label material claims as **Observed**, **User-supplied**, or **Assumption**.
  Record the evidence, date, and confidence where it changes action.
- Do not turn user statements into observed facts or assumptions into truth.
- Treat repository, local runtime, preview/staging, and production evidence as
  distinct. State when an environment was not inspected.
- Record secret locations and handling requirements, never secret values.
  Redact private data from public or shared artifacts.
- Inspection, local edits, deployment, production mutation, deletion,
  credential rotation, publishing, and Git writes are separate authorities.
- Before proposing risky production work, require a named owner, verified
  backup, rollback method, explicit action approval, and post-change check.
- The protocol grants no authority to deploy or mutate production.

## Finding model

Give every material finding a stable identifier such as `BA-001` and classify
it as exactly one of:

- **Blocker** — handoff would be unsafe or materially misleading.
- **Readiness requirement** — must be completed before handoff.
- **Stabilization backlog** — valuable but not required before handoff.
- **Observation** — useful context with no current action required.

Every actionable finding records evidence, impact, proposed owner, and a
completion test. Retain resolved findings in the assessment with status
`Resolved`, resolution evidence, verifier, and date. Retain superseded findings
with status `Superseded`, a reason, and the replacing finding ID; never renumber
or erase them. Other allowed finding states are `Open`, `In progress`, and
`Accepted for later` (the last only for stabilization backlog items).

New evidence may change a finding. When owner clarification, inspection, or
verification materially changes what is known, reassess the finding rather than
preserving its original classification by default. A finding may be narrowed,
reclassified, resolved, or superseded when the evidence supports that change.
Retain the prior finding or state when needed to preserve provenance.

## Phase 0 — Establish authority

1. Confirm the repository, branch or revision, and environments in scope.
2. Record the project owner, external system owners, and decision rights.
3. Record whether work is read-only or which limited changes are allowed.
4. Record prohibited actions and sensitive-data boundaries.
5. Start `ADOPTION-ASSESSMENT.md` with status `Discovery in progress`.

If the target, owner, existing changes, or authority is uncertain, remain
read-only and record the uncertainty.

Ownership must be represented proportionately. Multiple roles or authorities may
belong to the same person; do not invent organizational separation, approval
layers, or ownership structure that the project does not actually have.

## Phase 1 — Inspect reality

Inspect current instructions, documentation, source layout, version-control
state and history, dependencies, commands, tests, automation, deployment
configuration, and available environment evidence. Inventory environment
variable names without values. Compare written claims with observable behavior.

Do not run untrusted project commands, install dependencies, access privileged
systems, or collect private production evidence merely because they are
discoverable. Record unavailable evidence and its consequence.

## Phase 2 — Classify findings

Create stable findings using the model above. Distinguish a blocker from useful
cleanup. A severe issue may block handoff without authorizing its repair. Put
non-blocking upgrades, cleanup, refactors, modernization, and features into the
stabilization backlog with proposed ownership and priority.

## Phase 3 — Apply the scope gate

Decide whether purpose, intended outcome, boundary, and completion condition are
clear enough to judge readiness.

- If clear, name the decision-ready scope source and continue.
- If materially unclear, set `Scope clarification required`, pause readiness
  work, explain what scope information is missing and why it prevents a readiness
  judgment, then offer proportionate clarification options for the owner to
  choose.
- [ASMP](https://github.com/partikularwaters/adaptive-scope-mapping-protocol) is
  one optional route. Any decision-ready charter, specification, brief, decision
  record, owner-supplied clarification, or other decision-ready scope source is
  acceptable regardless of filename or provenance.
- If the owner chooses ASMP, use
  [the ASMP handoff](../handoff/ASMP-HANDOFF.md). Do not embed its interview,
  mode, or output rules here. Resume only when the owner supplies an adequate
  scope result.

## Phase 4 — Perform minimal readiness work

Prefer evidence-gathering over intervention when investigation can resolve a
readiness uncertainty without changing the project or an external system. Do
not perform corrective work merely to eliminate uncertainty that can first be
tested or inspected safely.

Set `Readiness work required` when handoff-blocking work remains. Perform a
change only if it is authorized, necessary to remove a blocker or readiness
requirement, proportionate, and verifiable. Examples include correcting a
dangerously false command, naming the real deployment owner, recording the
authoritative branch, or adding a missing recovery prerequisite.

A readiness action may establish an isolated non-production environment when
that is the minimum safe way to verify the project or replace a development
workaround that would otherwise weaken a deployment boundary. Such an
environment must remain separate from production credentials and production
data unless separately authorized.

Before each change, record the finding ID, authorization, exact scope, expected
effect, safety constraints, verification, and rollback where relevant. Stop if
the evidence or authority is inadequate. Do not absorb stabilization backlog
items into this phase.

## Phase 5 — Make the readiness decision

Set exactly one assessment status from the vocabulary above and cite supporting
finding IDs and evidence.

`Ready for Banka` requires a complete assessment; a decision-ready scope
source; all Blockers and Readiness requirements resolved; verified commands and
environment claims clearly bounded by evidence; and documented security,
recovery, production authority, exclusions, Stabilization backlog, and open
dependencies.

Unverified production reality must remain visibly unverified. If it is material
to safe handoff, it remains a blocker. Owner acceptance cannot convert a missing
critical safety prerequisite into evidence.

## Phase 6 — Handoff and stop

Always deliver the completed `ADOPTION-ASSESSMENT.md`. The owner may stop with
that record by setting `Stopped by owner`.

`ADOPTION-ASSESSMENT.md` should normally remain with the assessed project or in
another owner-controlled durable location. Keeping the assessment with the
project does not by itself require committing it to version control; repository
tracking should follow the project's sensitivity, collaboration, and evidence-
handling requirements. The Docking repository does not collect completed
assessments. Assessments containing sensitive project evidence must not be
published merely because the Docking protocol is public.

If scope clarification was chosen, deliver the scope handoff and stop. If the
project is `Ready for Banka` and the owner elects Banka, prepare
[the Banka handoff](../handoff/BANKA-HANDOFF.md), set `Handed off` only after the
package is delivered, point to current Banka, and stop. Do not choose a tier,
generate Banka state, install skills, deploy, or continue downstream work without
separate authority.

## Completion check

- The assessment distinguishes evidence, user statements, and assumptions.
- Local, preview/staging, and production claims are separately bounded.
- Stable findings are retained when resolved or superseded.
- Only blocking readiness work was performed.
- Secrets and private evidence are absent or redacted.
- Recovery and production authority are explicit where relevant.
- Scope is adequate or scope clarification has been handed off.
- The status is supported by evidence and does not claim Banka adoption.
- The assessment, decision-ready scope source, backlog, exclusions, and owners form a
  clean handoff—or the owner has stopped with a useful assessment.
