#!/usr/bin/node

import { spawn } from "node:child_process";
import { once } from "node:events";
import { promisify } from "node:util";
import child_process from "node:child_process";

const exec = promisify(child_process.exec);
const copyStep = await exec(
  "cp docker/files/global_config/overrides/WallStreetAdapter/etc/{license.txt,signature.txt,wsscore.xml} adapter/Blade/overrides/WallStreetAdapter/etc/",
);

console.log(copyStep.stdout);
console.log(copyStep.stderr);

const jarBuild = await exec("./gradlew :WallStreetAdapter:bootJar");

console.log(jarBuild.stdout);
console.log(jarBuild.stderr);

const clearLogs = await exec("rm adapter/Blade/DataSource/var/*.log");

console.log(clearLogs.stdout);
console.log(clearLogs.stderr);

const adapterRun = spawn(
  "java",
  ["-jar", "../../../adapter/build/libs/WallStreetAdapter-dev.jar"],
  {
    cwd: `./adapter/Blade/DataSource`,
    env: { CONFIG_BASE: "../../global_config/" },
  },
);

adapterRun.stdout.on("data", (data) => {
  console.log(`${data}`);
});

adapterRun.stderr.on("data", (data) => {
  console.error(`${data}`);
});

const [code] = await once(adapterRun, "close");

console.log(`Adapter run exited with code ${code}`);
