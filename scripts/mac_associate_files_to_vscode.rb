extensions = %W(ascx asp aspx bash bash_login bash_logout bash_profile bashrc bat bowerrc c cc clj cljs cljx clojure cmd code-workspace coffee config cpp cs cshtml csproj css csx ctp cxx dockerfile dot dtd editorconfig edn eyaml eyml fs fsi fsscript fsx gemspec gitattributes gitconfig gitignore go h handlebars hbs hh hpp htm html hxx ini jade jav java js jscsrc jshintrc jshtm json jsp jsx less lua m makefile markdown md mdoc mdown mdtext mdtxt mdwn mjs mkd mkdn ml mli php phtml pl6 pl pm6 pm pod pp profile properties ps1 psd1 psgi psm1 pug py r rb rhistory rprofile rs rt scss sh shtml sql svg svgz t ts tsx txt vb vue wxi wxl wxs xaml xcodeproj xcworkspace xml yaml yml zlogin zlogout zprofile zsh zshenv zshrc)

puts 'Starting to associate files to vscode...'
vscode_app = `osascript -e 'id of app "Visual Studio Code"'`
extensions.each do |ext|
  puts "associating #{ext}..."
  `duti -s #{vscode_app.delete!("\n")} .#{ext} all`
end
puts 'Completed.'