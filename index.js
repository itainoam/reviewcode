#!/usr/bin/env node

var cp = require("child_process");
var program = require('commander');
const repoDir = process.cwd()

program
    .version('0.1.0')
    .arguments('<branch>')
    .option('-c, --compare <branch>', 'Branch used as baseline for finding changes. Defaults to origin/master.')
    .action(function (branch, env) {
        let params = [branch]
        if (env.compare) {
            params.push(env.compare)
        }
        const ls = cp.spawn(`${__dirname}/reviewcode.sh`, params, {
            cwd: repoDir
        })
        ls.stdout.on('data', (data) => {
            console.log(`${data}`)
        })

        ls.stderr.on('data', (data) => {
            console.log(`stderr: ${data}`)
        })
    })

program.parse(process.argv)