/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./www/**/*.dreego",
    "./www/**/*.html",
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter', 'system-ui', 'sans-serif'],
        mono: ['JetBrains Mono', 'Fira Code', 'monospace'],
      },
    },
  },
  plugins: [],
}