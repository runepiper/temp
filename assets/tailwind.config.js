/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './js/**/*.js',
    '../lib/*_web.ex',
    '../lib/*_web/**/*.*ex',
  ],
  theme: {
    colors: {
      'eufblue': '#00395B',
      'eufwhite': '#FDFDFD'
    },
    backgroundColor: {
      'eufblue': '#00395B',
      'eufwhite': '#FDFDFD'
    },
    extend: {},
  },
  plugins: [],
}