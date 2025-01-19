import { readFile, writeFile } from 'node:fs/promises';
import { parseArgs } from 'node:util';

/**
 * GLOBALS
 */

/**
 * INTERFACE DEFINITIONS
 */

interface ArgValues {
  operation?: string,
  infile?: string[],
  outfile?: string,
}

/**
 * HELPER FUNCTIONS
 */

function validateInputConvert(values: ArgValues) {
  // Example expected CLI command
  // run --operation=convert --infile=<filename> --outfile=<outfilename>
  if (!values.infile) {
    throw new Error('<infile> required for conversion.');
  };
  if (!values.outfile) {
    throw new Error('<outfile> required for conversion.');
  }
}

/**
 * Read in Generic format file
 */
async function readGEN(infile: string) {
  const data = await readFile(infile);
  const jsonStr = await JSON.parse(data.toString());

  return jsonStr;
}

/**
 * Write out Generic format file
 *
 * JSON with version number
 */
async function writeGEN(outfile: string, entries: any[]) {
  let data = {
    entries: entries
  }
  await writeFile(outfile, JSON.stringify(data), { mode: 0o600 });
}

/**
 * MAIN FUNCTION
 */

export async function run(args: string[]) {
  const { values } = parseArgs({
    args,
    options: {
      operation: {
        type: 'string',
        short: 'p',
      },
      infile: {
        type: 'string',
        short: 'i',
        multiple: true,
      },
      outfile: {
        type: 'string',
        short: 'o',
      },
    },
  });

  // Choose operation
  if (values.operation === 'convert') {
    validateInputConvert(values);
    let entries: string[] = [];
    entries = await readGEN(values.infile![0]);
    await writeGEN(values.outfile!, entries);
  } else {
    console.log('Operation not supported.');
  }
}