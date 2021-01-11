
buildPath="#{__dirname}/public"

module.exports=(env)->
	mode: "development"
	entry: './js/index.js'
	output:
		path: buildPath
		filename: 'bundle.js'
	performance:
		maxEntrypointSize: 1.5e6
		maxAssetSize: 1.5e6
	stats:
		modules: false
	devtool: 'cheap-source-map'
	devServer:
		contentBase: buildPath
		inline: true
		host: "0.0.0.0"
		stats: "minimal"
		port: 8080
	module:
		rules: [
			{
				loader: "worker-loader"
				test: /\.worker\.js$/
				options:
					filename: "[contenthash].js"
			}
		]
