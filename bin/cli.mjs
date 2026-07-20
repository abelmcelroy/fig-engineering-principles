#!/usr/bin/env node
import { readFileSync, writeFileSync, mkdirSync, readdirSync, existsSync } from 'node:fs'
import { dirname, join } from 'node:path'
import { fileURLToPath } from 'node:url'
import { homedir } from 'node:os'

const pkgRoot = join(dirname(fileURLToPath(import.meta.url)), '..')
const read = (rel) => readFileSync(join(pkgRoot, rel), 'utf8')

const place = (dest, content) => {
  mkdirSync(dirname(dest), { recursive: true })
  writeFileSync(dest, content)
  process.stdout.write(`installed -> ${dest}\n`)
}

const claude = join(homedir(), '.claude')
for (const skill of readdirSync(join(pkgRoot, 'skills'))) {
  if (existsSync(join(pkgRoot, 'skills', skill, 'SKILL.md'))) {
    place(join(claude, 'skills', skill, 'SKILL.md'), read(join('skills', skill, 'SKILL.md')))
  }
}
place(join(claude, 'agents', 'fig-agent.md'), read('agents/fig-agent.md'))
