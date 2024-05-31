module.exports = {
    content: [
      './_drafts/**/*.html',
      './_includes/**/*.html',
      './_layouts/**/*.html',
      './blog/**/*.html',
      './_posts/*.md',
      './*.md',
      './*.html',
    ],
    theme: {

        fontFamily: {
            'outfit': ['Outfit', 'sans-serif']
        },
        extend: {
            aspectRatio: {
                '4/3': '4 / 3',
            },
            colors: {
                primary: {
                    '50': '#f0f2fd',
                    '100': '#e4e7fb',
                    '200': '#cdd2f8',
                    '300': '#afb5f2',
                    '400': '#8f8fea',
                    '500': '#7973e1',
                    '600': '#6a59d3',
                    '700': '#5a49b9',
                    '800': '#4a3d96',
                    '900': '#3f3877',
                    '950': '#262046',
                  },
            },

            borderRadius: {
                '4xl': '80px',
                '40px': '40px',
            },
        },
    }
  }
  