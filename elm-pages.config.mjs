import { defineConfig } from "vite";
import adapter from "./netlify.js";
import tailwindcss from "@tailwindcss/vite";


export default {
  vite: defineConfig({ plugins: [tailwindcss()] }),
  adapter,
  headTagsTemplate(context) {
    return `
<link rel="preload" href="/style.css" as="style" />
<link rel="stylesheet" href="/style.css" />
<link rel="icon" href="/media/logo.svg">
<link rel="mask-icon" href="/media/logo.svg" color="#000000">
<link rel="apple-touch-icon" href="/media/logo-180.png">
<meta name="generator" content="elm-pages v${context.cliVersion}" />
<meta name="theme-color" media="(prefers-color-scheme: light)" content="#ffffff" />

<script defer data-domain="capybara.house" src="https://plausible.escaping.network/js/plausible.js"></script>
`;
    //  <link rel="manifest" href="manifest.json">

  },
  preloadTagForFile(file) {
    // add preload directives for JS assets and font assets, etc., skip for CSS files
    // this function will be called with each file that is procesed by Vite, including any files in your headTagsTemplate in your config
    return !file.endsWith(".css");
  },
};

{/* <meta name="theme-color" media="(prefers-color-scheme: dark)" content="#0f172a" /> */ }