import { defineConfig } from "vite";
import adapter from "elm-pages/adapter/netlify.js";

export default {
  vite: defineConfig({}),
  adapter,
  headTagsTemplate(context) {
    return `
<link rel="stylesheet" href="/style.css" />
<link rel="icon" href="/media/logo.svg">
<link rel="mask-icon" href="/media/logo.svg" color="#000000">
<link rel="apple-touch-icon" href="logo-180.png">
<meta name="generator" content="elm-pages v${context.cliVersion}" />
<meta name="theme-color" media="(prefers-color-scheme: light)" content="#ffffff" />

<script defer data-domain="capybara.house" src="https://plausible.escaping.network/js/plausible.js"></script>
<script>var d=document,w="https://tally.so/widgets/embed.js",v=function(){"undefined"!=typeof Tally?Tally.loadEmbeds():d.querySelectorAll("iframe[data-tally-src]:not([src])").forEach((function(e){e.src=e.dataset.tallySrc}))};if("undefined"!=typeof Tally)v();else if(d.querySelector('script[src="'+w+'"]')==null){var s=d.createElement("script");s.src=w,s.onload=v,s.onerror=v,d.body.appendChild(s);}</script>

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