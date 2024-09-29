import kleur from 'kleur';
import svgCaptcha from 'svg-captcha';


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

export async function captcha() {
  try {
    const captcha = svgCaptcha.create({
      size: 6,
      ignoreChars: '0o1i',
      color: true,
      background: '#fff',
      width: 200,
      height: 75,
      fontSize: 52
    });
    // svgCaptcha.loadFont(pathToFont);
    return captcha;
  } catch (error) {
    throw new Error(error);
  }
}