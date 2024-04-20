import kleur from 'kleur';

export async function environmentVariable(name) {
  const result = process.env[name];
  if (result) {
    return result;
  } else {
    throw `No environment variable called ${kleur
      .yellow()
      .underline(name)}\n\nAvailable:\n\n${Object.keys(process.env)
        .slice(0, 5)
        .join("\n")}`;
  }
}