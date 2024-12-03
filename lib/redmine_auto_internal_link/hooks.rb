module RedmineAutoInternalLink
  class Hooks < Redmine::Hook::ViewListener
    # コメント保存時にフックする
    def controller_issues_edit_after_save(context = {})
      update_comment_internal_links(context[:journal])
    end

    private

    def update_comment_internal_links(journal)
      return unless journal.notes.present?

      host_with_path = Setting.host_name + Redmine::Utils.relative_url_root.to_s
      external_link_pattern = %r{https?://#{Regexp.escape(host_with_path)}/issues/(\d+)(#note-\d+)?}
      internal_link_format = '[#\1\2](#{path_to_issue(\1)}\2)'

      updated_notes = journal.notes.gsub(external_link_pattern) do
        issue_id = Regexp.last_match(1)
        note_id = Regexp.last_match(2)
        "##{issue_id}#{note_id}"
      end

      journal.update(notes: updated_notes) if updated_notes != journal.notes
    end
  end
end
