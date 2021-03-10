module.exports = {
    purge: ['app/views/**/*.haml'],
    darkMode: 'media', // or 'media' or 'class'
    future: {
        defaultLineHeights: true,
        standardFontWeights: true,
        purgeLayersByDefault: true,
        removeDeprecatedGapUtilities: true
    },
    theme: {
        extend: {
            colors: {
                'red': {
                    '50': '#f3e2e3',
                    '100': '#f2d9da',
                    '200': '#eec3c5',
                    '300': '#ea9fa0',
                    '400': '#e87373',
                    '500': '#e82c2c',
                    '600': '#ad1c1a',
                    '700': '#781a17',
                    '800': '#531713',
                    '900': '#481814',
                },
                'green': {
                    '50': '#f6f9f6',
                    '100': '#f0f4f0',
                    '200': '#dbe6db',
                    '300': '#bdd0bd',
                    '400': '#97b597',
                    '500': '#6d976d',
                    '600': '#577a57',
                    '700': '#445f44',
                    '800': '#374e37',
                    '900': '#334833',
                },
                'blue': {
                    '50': '#f4f8fb',
                    '100': '#ecf3f8',
                    '200': '#d5e6f0',
                    '300': '#b0cfe3',
                    '400': '#86b5d5',
                    '500': '#5195c2',
                    '600': '#3978a2',
                    '700': '#2c5c7d',
                    '800': '#254e6a',
                    '900': '#21465e',
                },
                'gray': {
                    '50': '#f7f7f7',
                    '100': '#f2f2f2',
                    '200': '#e3e3e3',
                    '300': '#c9c9c9',
                    '400': '#adadad',
                    '500': '#8c8c8c',
                    '600': '#707070',
                    '700': '#575757',
                    '800': '#474747',
                    '900': '#424242',
                },
                'praxis': {
                    '50': '#fdf6ec',
                    '100': '#fcefde',
                    '200': '#f9ddbd',
                    '300': '#f4bf85',
                    '400': '#ee943a',
                    '500': '#d37012',
                    '600': '#ad560b',
                    '700': '#843f06',
                    '800': '#6e3102',
                    '900': '#6b2d00',
                }
            }
        },
    },
    variants: {
        extend: {},
    },
    plugins: [],
}
