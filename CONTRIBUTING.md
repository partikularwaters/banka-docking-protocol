# Contributing

This repository is a pre-1.0 draft. Begin by reading
[the canonical protocol](protocol/BANKA-DOCKING.md). Keep changes within
assessment, minimal readiness work, and handoff; propose Banka or ASMP changes in
their own repositories.

For every change:

1. Explain the behavior or safety boundary being changed and why.
2. Update the protocol, template, examples, README, and changelog wherever the
   contract changes.
3. Preserve the complete status vocabulary and the canonical
   `ADOPTION-ASSESSMENT.md` filename.
4. Keep examples fictional and sanitized. Do not contribute credentials,
   customer data, private logs, or claims about live systems.
5. Run `sh scripts/check-repo-integrity.sh`.

Material AI-assisted contributions require transparent attribution in the
commit or pull-request description. Name the contributing model or tool and
describe its role without implying authorship of work it did not perform.

Do not copy Banka's rubric, templates, skill bodies, or runtime instructions, or
ASMP's protocol bodies and output templates. Link to current external authority
instead.

## Example and evidence safety

Public examples should use fictional or synthetic evidence by default.

Real-project evidence may be included only with explicit owner authorization and
must be minimized and redacted. Do not publish credentials, private data,
security-sensitive details, or operational information that is unnecessary to
demonstrate protocol behavior.

A public Docking repository does not make an assessed project's
`ADOPTION-ASSESSMENT.md` public.
