import svelte from 'rollup-plugin-svelte'
import resolve from '@rollup/plugin-node-resolve'
import commonjs from '@rollup/plugin-commonjs'
import postcss from 'rollup-plugin-postcss'
import livereload from 'rollup-plugin-livereload'
import { terser } from 'rollup-plugin-terser'

const production = !process.env.ROLLUP_WATCH

export default {
	input: 'src/main.js',
	output: {
		sourcemap: true,
		format: 'iife',
		name: 'app',
		file: `public/bundle.js`
	},
	plugins: [
		svelte(),

		// If you have external dependencies installed from npm, you'll most likely need these plugins. In
		// some cases you'll need additional configuration — consult the documentation for details: https://github.com/rollup/rollup-plugin-commonjs
		resolve({
			browser: true,
			dedupe: importee => importee === 'svelte' || importee.startsWith('svelte/')
		}),
		commonjs(),

		postcss({
      extract: true,
      minimize: true,
      use: [
        ['sass', {
          includePaths: [
            'src/theme',
            'node_modules'
          ]
        }]
      ]
		}),
		
		// If we're building for production (npm run build instead of npm run dev), minify, otherwise refresh browser when changes are detected
		production && terser() || livereload('public'),
	],
	watch: {
		clearScreen: false
	}
}
