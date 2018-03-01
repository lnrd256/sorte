let mix = require('laravel-mix');
let CopyWebpackPlugin = require('copy-webpack-plugin');
/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */

mix.js('resources/assets/js/app.js', 'public/js')
   .sass('resources/assets/sass/app.scss', 'public/css/');
// mix.webpackConfig({
//         plugins: [
//            new CopyWebpackPlugin([{ from: 'node_modules/amcharts3/amcharts/images', to: 'amcharts/images' },])
//             ]
//         })