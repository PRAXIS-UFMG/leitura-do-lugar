module.exports = {
    purge: [
        'app/helpers/*.rb',
        'app/views/**/*.slim',
        'app/components/*.slim',
        'app/packs/javascript/controllers/**/*.js'
    ],
    darkMode: 'media', // or 'media' or 'class'
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
                }
            }
        },
    },
    variants: {
        extend: {
            backgroundColor: ['active']
        },
    },
    plugins: [require('@tailwindcss/forms')],
}
