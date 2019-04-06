# Be sure to restart your server when you modify this file.
Rails.application.configure do

    # Version of your assets, change this if you want to expire all your assets.
    config.assets.version = '1.0'
    config.assets.compile = true
    config.assets.compress = true
    # Add additional assets to the asset load path
    # Rails.application.config.assets.paths << Emoji.images_path

    # Precompile additional assets.
    # application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
    # Rails.application.config.assets.precompile += %w( search.js )

    config.assets.paths << Rails.root.join('public/lib')


    config.assets.precompile << /\.(?:svg|eot|woff|ttf)\z/
    config.assets.precompile += ['tags.js',
                                 'uploads.js',
                                 'knitter.js',
                                 'annotations.js',
                                 'maps.js']

end