module.exports = {
    mode: 'jit',
    purge: [
        'lib/icons/*',
        'app/helpers/*',
        'app/views/**/*',
        'app/packs/entrypoints/*',
        'app/packs/javascript/controllers/**/*.js'
    ],
    darkMode: 'media', // or 'media' or 'class'
    variants: {
        extend: {
            backgroundColor: ['active']
        },
    },
    plugins: [
        require('@tailwindcss/forms'),
        require('@tailwindcss/typography')
    ],
    theme: {
        extend: {
            colors: {
                'praxis': {
                    '50': '#fdf6ec',
                    '100': '#fcefde',
                    '200': '#f9ddbd',
                    '300': '#f4bf85',
                    '400': '#ee943a',
                    DEFAULT: '#d37012',
                    '500': '#d37012',
                    '600': '#ad560b',
                    '700': '#843f06',
                    '800': '#6e3102',
                    '900': '#6b2d00',
                },
                'gray': {
                    '50': '#F6F6F6',
                    '100': '#E0E0E0',
                    '200': '#B5B5B5',
                    '300': '#8A8A8A',
                    '400': '#5E5E5E',
                    '500': '#333333',
                    DEFAULT: '#333333',
                    '600': '#242424',
                    '700': '#141414',
                    '800': '#050505',
                    '900': '#000000'
                },
            }
        },
    },
}
