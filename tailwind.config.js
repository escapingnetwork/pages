/** @type {import('tailwindcss').Config} */

const colors = require('tailwindcss/colors')

export default {
  darkMode: 'class',
  content: [
    "./app/**/*.{elm, ts, js}",
    "./src/**/*.{elm, ts, js}",
    "./index.html"
  ],
  theme: {
    extend: {
      colors: {
        primary: colors.yellow,
      },
    },
  },
  plugins: [
    require('@tailwindcss/typography'),
  ],
}

