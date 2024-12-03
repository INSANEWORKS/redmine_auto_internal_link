# Redmine Auto Internal Link Plugin

A Redmine plugin that automatically converts external Redmine issue URLs in comments to internal links. 

## Features

- Detects external Redmine issue links in comments (e.g., `https://example.com/issues/123#note-2`).
- Automatically converts them to Redmine internal link format (e.g., `#123#note-2`).
- Supports dynamically resolving the Redmine host and path configuration.

## Installation

1. Clone this repository into your Redmine plugin directory:

   ```bash
   cd /path/to/redmine/plugins
   git clone https://github.com/INSANEWORKS/redmine_auto_internal_link.git
   ```

2. Ensure the directory structure looks like this:

   ```
   plugins/
   └── redmine_auto_internal_link/
       ├── init.rb
       └── lib/
           └── redmine_auto_internal_link/
               └── hooks.rb
   ```

3. Run the following command to load the plugin:

   ```bash
   bundle exec rake redmine:plugins:migrate RAILS_ENV=production
   ```

4. Restart your Redmine instance.

## Usage

1. Navigate to an issue and add a comment containing an external Redmine link, e.g.:

   ```
   This relates to https://example.com/issues/456#note-3.
   ```

2. After saving, the link will automatically be converted to the internal Redmine format:

   ```
   This relates to #456#note-3.
   ```

## Compatibility

- Redmine 6.x
- Ruby 3.0 or higher

## Development

If you encounter any issues or have feature requests, please open an issue on the [GitHub repository](https://github.com/INSANEWORKS/redmine_auto_internal_link/issues).

## License

This plugin is released under the MIT License. See the [LICENSE](LICENSE) file for details.

---

Happy Redmine-ing!
