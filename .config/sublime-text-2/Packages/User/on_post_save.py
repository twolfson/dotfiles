import sublime_plugin


# TODO: This could be expanded to any event listener action
# TODO: How do we deal with multiple levels of triggers =(
class OnPostSave(sublime_plugin.EventListener):
    def on_post_save(self, view):
        return
        # Pull in settings
        settings = view.settings()

        # If there are on_post_save commands, run them
        post_save_cmds = settings.get('on_post_save')
        if post_save_cmds:
            # For each command
            for cmd in post_save_cmds:
                # Look up scope
                scope = view
                if cmd.get('scope', None):
                    # TODO: Automatically robustify this this
                    scope = getattr(scope, cmd['scope'])()

                # Run the command in its scope
                scope.run_command(cmd['command'], cmd['args'])
