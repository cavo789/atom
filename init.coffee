# init.coffee
#
# Author : AVONTURE Christophe
# Repository : https://github.com/cavo789/atom
#
# How to use :
# ==========
#
# Copy this file to your %USERPROFILE%\.atom folder; overwrite
# 	(or append) your current init.coffee file by this one.
#
# Objectives :
# ==========
#
# * When a file will be saved
#		* For all text files
#			* Autoindent the editor's content (only for somes
#				"grammar" like "text.html.php" (whitelist concept))
#			* Remove trailing whitespace and tab (i.e. at the end of the line)
#			* If a line only contains tabs or spaces and nothing else, remove
#				these unneeded characters
#			* Replace spaces blocks (min 3 max 4 consecutive spaces) by tab
#			* If there are more than one consecutive empty lines, just keep one
#
#		* Only for VBS
#			* Replace some keywords, solve typo issue (f.i. replace `WScript.Echo`
#				by `wScript.echo` so files will be a few normalized)

atom.workspace.observeTextEditors (editor) ->

	editor.buffer.onWillSave ->

		# Do nothing for Atom's configuration files
		return if editor.getPath() is atom.config.getUserConfigPath()

		# Inform the user about this script
		#atom.notifications.addInfo 'init.coffee - CAVO linting', icon: 'pencil'

		# For instance text.html.php, source.asp.vb.net, ...
		currentGrammar = editor.getGrammar()?.scopeName

		onlyIfGrammars = ['text.html.php']
		if currentGrammar in onlyIfGrammars
			# Auto-indent content
			msg = new String("AutoIndent ")
			msg = msg.concat(currentGrammar)
			#atom.notifications.addInfo msg, icon: 'pencil'
			#editor.autoIndentBufferRows 0, editor.getBuffer().getLineCount() - 1

		# First, mark the start position for 'undo'
		_checkpoint = editor.createCheckpoint()

		# START ---------------------------------------
		# From here, we'll replace somes patterns

		# Remove trailing whitespace and tab (i.e. at the end of the line)
		# https://stackoverflow.com/a/9532388
		_regex = /[ \t]+$/gm
		editor.scan _regex, (match) -> match.replace('')

		# If a line only contains tabs or spaces and nothing else,
		# replace the line with just an empty line
		_regex = /^[ |\t]*[\n\r]*$/gm
		editor.scan _regex, (match) -> match.replace('')

		# Replace spaces blocks (min 3 max 4 consecutive spaces) by tab
		_regex = / {3,4}/gm
		editor.scan _regex, (match) -> match.replace('\t')

		# If there are more than one consecutive empty lines (having or not tabs),
		# just keep one
		_regex = /(\n(\t*)){3,}/m
		editor.scan _regex, (match) -> match.replace(match.match[0].replace(_regex,'\n\n$2'))

		# ---------------------------------------------------------------------------
		# Specific for .vbs files
		if path.extname(editor.getPath()) is ".vbs"
			# Force .vbs files to be recognized as VB.Net source files
			editor.setGrammar(atom.grammars.grammarForScopeName('source.asp.vb.net'))

			# Correct typo (f.i. replace WScript.Echo by, the normalized, wScript.echo)
			editor.scan(/wscript\.echo/gmi, (match) -> match.replace('wScript.echo'))
			editor.scan(/wscript\.quit/gmi, (match) -> match.replace('wScript.quit'))

		# END ---------------------------------------

		# Mark end position for 'undo'
		editor.groupChangesSinceCheckpoint(_checkpoint)

		#atom.notifications.addInfo 'init.coffee - CAVO linting - Done', icon: 'check'