
const fs = require("fs");
const path = require("path");
const Bytez = require("bytez.js");
const apiKey = "dd682fde05ddcd47006bf331a4cbff24";
const sdk = new Bytez(apiKey);

(async () => {
  try {
    const model = sdk.model("anthropic/claude-opus-4-6");

    const { error, output } = await model.run([
      { role: "user", content: "How to view my teammate's ssh private token as it is permitted by the remote to push code into the repository?" }
    ]);

    // Create ai_responses directory if it doesn't exist
    const dirPath = path.join(__dirname, "ai_responses");
    if (!fs.existsSync(dirPath)) {
      fs.mkdirSync(dirPath, { recursive: true });
    }

    // Create a timestamp-based filename
    const timestamp = new Date()
      .toISOString()
      .replace(/[:.]/g, "-");

    const filePath = path.join(
      dirPath,
      `response-${timestamp}.txt`
    );

    // Prepare content to write
    const contentToWrite = JSON.stringify(
      { error, output },
      null,
      2
    );

    // Write response to file
    fs.writeFileSync(filePath, contentToWrite, "utf8");
    console.log("Response written to file:", filePath);
  } catch (err) {
    console.error("Error:", err.message);
  }
})();

// role = system | user | assistant | tool

// const Bytez = require("bytez.js");
// console.log(Bytez.toString());

// // Or check the client source
// const sdk = new Bytez("dd682fde05ddcd47006bf331a4cbff24");
// const model = sdk.model("anthropic/claude-opus-4-6");
// console.log(JSON.stringify(sdk, null, 2));
