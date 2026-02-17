from ranger.api.commands import Command
import os
import subprocess


class fzf_select(Command):
    """
    :fzf_select

    Find a file using fzf.
    With a prefix argument select only directories.
    """

    def execute(self):
        if self.quantifier:
            # directories only
            command = (
                r"find -L . \( -path '*/\.*' -o -fstype 'dev' -o -fstype 'proc' \) -prune "
                r"-o -type d -print 2> /dev/null | sed 1d | cut -b3- | fzf +m"
            )
        else:
            # files and directories
            command = (
                r"find -L . \( -path '*/\.*' -o -fstype 'dev' -o -fstype 'proc' \) -prune "
                r"-o -print 2> /dev/null | sed 1d | cut -b3- | fzf +m"
            )

        fzf = self.fm.execute_command(command, stdout=subprocess.PIPE)
        stdout, _ = fzf.communicate()

        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.decode().rstrip("\n"))
            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                self.fm.select_file(fzf_file)


class fzf_locate(Command):
    """
    :fzf_locate

    Find a file using locate + fzf.
    """

    def execute(self):
        command = r"locate home media | fzf -e -i"

        fzf = self.fm.execute_command(command, stdout=subprocess.PIPE)
        stdout, _ = fzf.communicate()

        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.decode().rstrip("\n"))
            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                self.fm.select_file(fzf_file)

