class Middleman::Extensions::PagePipeline < Middleman::Extension
  register :page_pipeline
  option :shared_dir, 'external/directory', 'Directory for shared pages'
  option :pages_dir, 'pages', 'Directory for pages'

  def manipulate_resource_list resources
    # Remove pages, they're added back later
    resources.reject! do |resource|
      true unless resource.path.include? ?/
      true if resource.path.start_with? File.join options.pages_dir, ?/
    end

    [options.shared_dir, options.pages_dir].inject(resources) do |resources, directory|
      # Normalise input
      directory = if Pathname(directory).relative?
        File.expand_path File.join app.source_dir, directory
      else
        File.expand_path directory
      end

      # Add files outside the root, else skip as there would be a StackError
      unless directory.include? app.root
        app.files.reload_path Pathname(directory).relative_path_from Pathname app.root
      end

      # Build an array of resources from the directory
      pages = Dir.glob(directory + '**/*', File::FNM_DOTMATCH).map do |sourcepath|
        next if File.directory? sourcepath
        buildpath = app.sitemap.extensionless_path sourcepath.sub directory + ?/, ''
        Middleman::Sitemap::Resource.new app.sitemap, buildpath, sourcepath
      end

      # Add the new pages to the resource list
      resources.concat pages.compact
    end
  end
end
