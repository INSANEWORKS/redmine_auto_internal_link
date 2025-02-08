module RedmineAutoInternalLink
  class Hooks < Redmine::Hook::ViewListener
    # Apply link conversion to both Journal (comments) and Issue (ticket descriptions)
    [Journal, Issue].each do |model|
      model.class_eval do
        after_save :convert_external_links

        private

        def convert_external_links
          target_field = self.is_a?(Journal) ? :notes : :description
          return unless self[target_field].present?

          host_with_path = Setting.host_name + Redmine::Utils.relative_url_root.to_s
          external_link_pattern = %r{https?://#{Regexp.escape(host_with_path)}/issues/(\d+)(#note-\d+)?}

          updated_text = self[target_field].gsub(external_link_pattern) do
            issue_id = Regexp.last_match(1)
            note_id = Regexp.last_match(2)
            "##{issue_id}#{note_id}"
          end

          update_column(target_field, updated_text) if updated_text != self[target_field]
        end
      end
    end
  end
end
