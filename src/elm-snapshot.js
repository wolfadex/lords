const fs = require("fs");
const compileToString = require("node-elm-compiler").compileToString;
const { program } = require("commander");
const { parse } = require("path");

const snapshotKeyPrefix = "elm-snapshot_";
const snapshotKeyModel = `${snapshotKeyPrefix}model`;
const snapshotKeyAutoEnabled = `${snapshotKeyPrefix}auto-enabled`;
const snapshotKeySnapNext = `${snapshotKeyPrefix}snap-next`;

const snapshotInit = `var $author$project$1$init = function ($2) {
    var snapshot = localStorage.getItem("${snapshotKeyModel}");
    if (snapshot != null) {
      try {
        return {
          "$": "#2",
          a: JSON.parse(snapshot),
          b: { "$": 2, m: { "$": "[]" } }
        };
      } catch(err) {
        return $3
      }
    } else {
        return $3
    }
}`;
const initReg = new RegExp(
  /var \$author\$project(\$.*)\$init = function \((.*)\) \{\n\treturn ([\w\\{:,\)\};$\(\n\s\t]*)\n};/,
);
const updateReplaceText = "stepper(model = pair.a, viewMetadata);";
const snapshotUpdate = `if (localStorage.getItem("${snapshotKeyAutoEnabled}") !== "false" || localStorage.getItem("${snapshotKeySnapNext}")) {
      localStorage.setItem("${snapshotKeyModel}", JSON.stringify(pair.a));
      localStorage.removeItem("${snapshotKeySnapNext}");
    }
    ${updateReplaceText}`;

const tailEnd = ";}(this));";
const snapshotTailend = `${tailEnd}
function addSnapshot() {
  var snapModal = document.createElement("div");
  var autoSnap = document.createElement("label");
  var autoSnapLabel = document.createElement("span");
  var autoSnapCheckbox = document.createElement("input");
  var snapButton = document.createElement("button");
  var clearSnap = document.createElement("button");

  snapModal.style.position = "fixed";
  snapModal.style.left = "2rem";
  snapModal.style.bottom = "2rem";
  snapModal.style.display = "flex";
  snapModal.style.flexDirection = "column";
  snapModal.style.fontFamily = "sans-serif";
  snapModal.style.backgroundColor = "antiquewhite";
  snapModal.style.border = "2px solid black";
  
  autoSnapLabel.innerText = "Auto-Snapshot:";
  autoSnap.style.margin = "0.5rem";

  autoSnapCheckbox.setAttribute("type", "checkbox");

  const autoSnapEnabled = localStorage.getItem("${snapshotKeyAutoEnabled}") !== "false";

  if (autoSnapEnabled) {
    autoSnapCheckbox.setAttribute("checked", true);
  }

  autoSnapCheckbox.addEventListener("click", function() {
    if (autoSnapCheckbox.checked) {
      localStorage.setItem("${snapshotKeyAutoEnabled}", true);
      snapButton.setAttribute("disabled", true);
    } else {
      localStorage.setItem("${snapshotKeyAutoEnabled}", false);
      snapButton.removeAttribute("disabled");
    }
  });

  autoSnap.appendChild(autoSnapLabel);
  autoSnap.appendChild(autoSnapCheckbox);

  snapButton.innerText = "Snapshot Next Update";
  snapButton.style.margin = "0.5rem";
  snapButton.addEventListener("click", function() {
    localStorage.setItem("${snapshotKeySnapNext}", true);
  });

  if (autoSnapEnabled) {
    snapButton.setAttribute("disabled", true);
  }

  clearSnap.innerText = "Clear Snapshot";
  clearSnap.style.margin = "0.5rem";
  clearSnap.addEventListener("click", function() {
    localStorage.removeItem("${snapshotKeyModel}");
  });

  snapModal.appendChild(autoSnap);
  snapModal.appendChild(snapButton);
  snapModal.appendChild(clearSnap);

  document.body.appendChild(snapModal);
}
requestAnimationFrame(addSnapshot);`;

program
  .version("0.1.0")
  .option("--output", "the output file")
  .option("--debug", "debug mode enabled")
  .parse(process.argv);
console.log(process.argv[2], program.opts(), process.argv.slice(3));
compileToString([process.argv[2]], {
  //   output: program.output,
  debug: program.debug,
}).then(function (data) {
  let snapshottedData = data;
  if (!program.debug) {
    snapshottedData = snapshottedData.replace(initReg, snapshotInit);
    snapshottedData = snapshottedData.replace(
      updateReplaceText,
      snapshotUpdate,
    );
    snapshottedData = snapshottedData.replace(tailEnd, snapshotTailend);
  }
  //   fs.writeFile(program.output, snapshottedData, function (err) {
  //     err ? console.error(err) : console.log("complete");
  //   });
});
